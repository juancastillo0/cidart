import 'dart:async';
import 'dart:io' as io;
import 'dart:io' show Directory, ProcessStartMode;

import 'compilation_event.dart';
import 'compiler_models.dart';
import 'compiler_service_utils.dart';
import 'process_runner.dart';

class CompilerService {
  CompilerService({
    ServiceConfig? config,
    this.runner = const ProcessRunnerIO(),
  }) : config = config ?? configDefault;

  final ServiceConfig config;
  final ProcessRunner runner;

  final Map<String, CurrentCompilation> logs = {};
  CurrentExecutedService? currentService;

  CurrentCompilation? currentCompilation;
  List<CompilationLog> get _compilationLogs =>
      currentCompilation!.compilationLogs;
  // Compilation? get compilation => currentCompilation == null
  //     ? null
  //     : Compilation.fromCurrentCompilation(
  //         currentCompilation!, config,
  //         // currentService == null ? compilationLogs.last. CompilationStatus.started : CompilationStatus.success,
  //       );

  bool starting = false;
  String _workingDirectory = Directory.current.path;

  final _streamController = StreamController<CompilationEvent>.broadcast();
  Stream<CompilationEvent> get stream => _streamController.stream;

  Future<String?> topOutput() async {
    if (currentService == null) return null;
    final str = await _exec(
      cliCommand: CliCommand(
        name: 'cidart-top-performance',
        command: [
          'top',
          ...runner.platform == CompilerPlatform.linux
              ? ['-b', '-n2', '-p']
              : ['-l2', '-pid'],
          '${currentService!.serverProcess.pid}',
        ],
        modifiedDate: config.createdDate,
        variables: [],
      ),
    );
    final split = str.split('\n');
    return split.sublist((split.length / 2).floor()).join('\n');
  }

  Future<List<CompilationLog>> startService() async {
    if (starting) throw StateError('starting');
    starting = true;
    _workingDirectory = Directory.current.path;
    String? commitId;

    void _onError(Object error, StackTrace stackTrace) {
      currentCompilation =
          currentCompilation!.copyWith(status: CompilationStatus.error);
      if (error is! ExecException) {
        _log('error: $error, stackTrace: $stackTrace');
      }
      if (commitId != null && commitId != currentService?.commitHash) {
        logs[commitId] = currentCompilation!;
      }
      starting = false;
    }

    try {
      final now = DateTime.now();
      currentCompilation = CurrentCompilation(
        commitHash: '',
        compilationLogs: [],
        status: CompilationStatus.started,
      );
      _log('starting compilation', time: now);
      final commitResult = await _exec(
        cliCommand: CliCommand(
          name: 'cidart-git-ls-remote',
          command:
              'git ls-remote \${gitRepo} refs/heads/\${gitBranch}'.split(' '),
          modifiedDate: config.createdDate,
          variables: [],
        ),
      );
      commitId = commitResult.split(RegExp(r'\s+')).first;
      currentCompilation = currentCompilation!.copyWith(commitHash: commitId);
      if (commitId == currentService?.commitHash) {
        throw StateError('same commit: $commitId');
      }
      final dirName =
          '${config.gitRepo.split('/').last}-${now.millisecondsSinceEpoch}-${commitId}';
      _log('commitId: $commitId, dirName: $dirName');
      _cloneTestAndCompile(dirName)
          .then((_) => _initProcess(commitId!))
          .onError(_onError)
          .then((_) {
        starting = false;
      });
      return _compilationLogs;
    } catch (e, s) {
      _onError(e, s);
      rethrow;
    } finally {
      print(_compilationLogs.join('\n===============\n'));
    }
  }

  Future<void> _cloneTestAndCompile(String dirName) async {
    await _exec(
      cliCommand: CliCommand(
        name: 'cidart-git-clone',
        command:
            'git clone --branch \${gitBranch} \${gitRepo} $dirName'.split(' '),
        modifiedDate: config.createdDate,
        variables: [],
      ),
    );
    _workingDirectory =
        '${Directory.current.path}${io.Platform.pathSeparator}$dirName';

    for (final command in config.commands) {
      await _exec(
        context: command.toString(),
        cliCommand: command,
      );
    }
  }

  Future<void> _initProcess(String commitId) async {
    final previousServer = currentService;
    if (currentService != null) {
      currentService!.serverProcess.kill();
      currentService = null;
    }
    try {
      final process = await runner.start(
        ProcessRunArgs(
          config.serverFile,
          [],
          workingDirectory: _workingDirectory,
        ),
        mode: ProcessStartMode.inheritStdio,
      );

      currentCompilation =
          currentCompilation!.copyWith(status: CompilationStatus.success);
      logs[commitId] = currentCompilation!;

      currentService = CurrentExecutedService(
        commitHash: commitId,
        serverDirectory: _workingDirectory,
        serverProcess: process,
      );

      // TODO: delete directory
    } catch (_) {
      if (previousServer != null) {
        // restart previous process
        final process = await runner.start(
          ProcessRunArgs(
            config.serverFile,
            [],
            workingDirectory: previousServer.serverDirectory,
          ),
          mode: ProcessStartMode.inheritStdio,
        );
        currentService = CurrentExecutedService(
          commitHash: previousServer.commitHash,
          serverDirectory: previousServer.serverDirectory,
          serverProcess: process,
        );
      }
      rethrow;
    }
  }

  Future<String> _exec({
    String? context,
    required CliCommand cliCommand,
  }) async {
    final commandSplit = processCliCommand(config.dynamicVariables, cliCommand);
    final executable = commandSplit[0];
    final arguments = commandSplit.sublist(1);
    final commandStr = '"$executable ${arguments.join(' ')}"'
        '${context == null ? '' : '. context: $context'}';
    final start = DateTime.now();
    _log('exec: $commandStr', time: start);

    final watch = Stopwatch()..start();
    final result = await runner.run(ProcessRunArgs(
      executable,
      arguments,
      workingDirectory: _workingDirectory,
    ));
    final elapsed = watch.elapsed;
    _log(
      'exec: $commandStr. Duration:${elapsed.inMilliseconds}ms.',
      execution: CommandExecution(
        command: cliCommand,
        durationMs: elapsed.inMilliseconds,
        endTime: start.add(elapsed),
        status: CompilationStatus.fromStatusCode(result.exitCode),
        result: ProcessExecResult.fromResult(result),
      ),
    );
    if (result.exitCode != 0 &&
        // warnings
        (commandStr != '"dart pub get"' || result.exitCode != 255)) {
      throw ExecException(
        result: result,
        context: context,
      );
    }
    return result.stdout as String;
  }

  void _log(
    String message, {
    DateTime? time,
    CommandExecution? execution,
  }) {
    final _time = time ?? DateTime.now();
    _compilationLogs.add(CompilationLog(
      id: _compilationLogs.length,
      message: message,
      time: _time,
      command: execution,
    ));
  }
}
