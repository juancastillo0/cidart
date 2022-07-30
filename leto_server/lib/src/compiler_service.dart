import 'dart:io';

import 'compiler_api_models.dart';
import 'compiler_models.dart';

final ServiceConfig configDefault = ServiceConfig(
  gitRepo: 'https://github.com/juancastillo0/room_signals',
  gitBranch: 'main',
  serverFile: 'bin/server',
  serviceId: 'default',
  commands: [
    CliCommand(
      name: '',
      command: 'dart pub get',
      modifiedDate: DateTime.now(),
      variables: [],
    ),
    CliCommand(
      name: '',
      command: 'dart analyze',
      modifiedDate: DateTime.now(),
      variables: [],
    ),
    CliCommand(
      name: '',
      command: 'dart test',
      modifiedDate: DateTime.now(),
      variables: [],
    ),
    CliCommand(
      name: '',
      command: 'compile exe \${serverFile}.dart --output \${serverFile}',
      modifiedDate: DateTime.now(),
      variables: [
        CliCommandVariable(
          CliCommandVariableType.dynamic,
          'serverFile',
        ),
      ],
    ),
  ],
);

class CompilerService {
  CompilerService({
    ServiceConfig? config,
  }) : config = config ?? configDefault;
  final ServiceConfig config;

  Map<String, String> get _dynamicVariables => {
        '\${serviceId}': config.serviceId,
        '\${gitRepo}': config.gitRepo,
        '\${gitBranch}': config.gitBranch,
        '\${serverFile}': config.serverFile,
      };

  final Map<String, List<CompilerLog>> logs = {};
  CurrentExecutedService? currentService;

  List<CompilerLog> compilationLogs = [];
  bool starting = false;
  String _workingDirectory = Directory.current.path;

  String get _gitRepo => config.gitRepo;
  String get _gitBranch => config.gitBranch;
  String get _serverFile => config.serverFile;

  Future<String?> topOutput() async {
    if (currentService == null) return null;
    final str = await _exec(
      'top',
      [
        ...Platform.isLinux ? ['-b', '-n2', '-p'] : ['-l2', '-pid'],
        '${currentService!.serverProcess.pid}',
      ],
    );
    final split = str.split('\n');
    return split.sublist((split.length / 2).floor()).join('\n');
  }

  Future<List<CompilerLog>> startService() async {
    if (starting) throw StateError('starting');
    starting = true;
    _workingDirectory = Directory.current.path;
    String? commitId;

    void _onError(Object error, StackTrace stackTrace) {
      if (error is! ExecException) {
        compilationLogs.add(CompilerLog(
          'error: $error, stackTrace: $stackTrace',
        ));
      }
      if (commitId != null && commitId != currentService?.commitHash) {
        logs[commitId] = compilationLogs;
      }
      starting = false;
    }

    try {
      final now = DateTime.now();
      compilationLogs = [CompilerLog('starting compilation', time: now)];
      final commitResult =
          await _exec('git', ['ls-remote', _gitRepo, 'refs/heads/$_gitBranch']);
      commitId = commitResult.split(RegExp(r'\s+')).first;
      if (commitId == currentService?.commitHash) {
        throw StateError('same commit: $commitId');
      }
      final dirName =
          '${_gitRepo.split('/').last}-${now.millisecondsSinceEpoch}-${commitId.substring(0, 10)}';
      compilationLogs.add(CompilerLog(
        'commitId: $commitId, dirName: $dirName',
      ));
      _cloneTestAndCompile(dirName)
          .then((_) => _initProcess(commitId!))
          .onError(_onError)
          .then((_) {
        starting = false;
      });
      return compilationLogs;
    } catch (e, s) {
      _onError(e, s);
      rethrow;
    } finally {
      print(compilationLogs.join('\n===============\n'));
    }
  }

  Future<void> _cloneTestAndCompile(String dirName) async {
    const dart = 'dart';

    await _exec('git', ['clone', '--branch', _gitBranch, _gitRepo, dirName]);
    _workingDirectory =
        '${Directory.current.path}${Platform.pathSeparator}$dirName';

    for (final command in config.commands) {
      final variables = command.variablesMap();
      final mapped = command.command.replaceAllMapped(
        RegExp('(${command.variables.map((e) => '\${${e.key}}').join('|')})'),
        (match) {
          final value = match.input.substring(match.start, match.end);
          final variable = variables[value]!;
          return _getVariableValue(variable);
        },
      );
      // TODO:
      final split = mapped.split(RegExp(r'\s'));
      await _exec(
        split[0],
        split.sublist(1),
        context: command.toString(),
      );
    }

    // await _exec(dart, ['pub', 'get']);
    // await _exec(dart, ['analyze']);
    // await _exec(dart, ['test']);
    // await _exec(
    //   dart,
    //   'compile exe $_serverFile.dart --output $_serverFile'.split(' '),
    // );
  }

  Future<void> _initProcess(String commitId) async {
    final previousServer = currentService;
    if (currentService != null) {
      currentService!.serverProcess.kill();
      currentService = null;
    }
    try {
      final process = await Process.start(
        _serverFile,
        [],
        mode: ProcessStartMode.inheritStdio,
        workingDirectory: _workingDirectory,
      );

      logs[commitId] = compilationLogs;

      currentService = CurrentExecutedService(
        commitHash: commitId,
        serverDirectory: _workingDirectory,
        serverProcess: process,
      );
      // TODO: delete directory
    } catch (_) {
      if (previousServer != null) {
        // restart previous process
        final process = await Process.start(
          _serverFile,
          [],
          mode: ProcessStartMode.inheritStdio,
          workingDirectory: previousServer.serverDirectory,
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

  Future<String> _exec(
    String executable,
    List<String> arguments, {
    String? context,
  }) async {
    final commandStr = '"$executable ${arguments.join(' ')}"'
        '${context == null ? '' : '. context: $context'}';
    compilationLogs.add(CompilerLog('exec: $commandStr'));

    final watch = Stopwatch()..start();
    final result = await Process.run(
      executable,
      arguments,
      workingDirectory: _workingDirectory,
    );
    final elapsed = watch.elapsed;
    compilationLogs.add(
      CompilerLog(
        'exec: $commandStr. Duration:${elapsed.inMilliseconds}ms.',
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

  String _getVariableValue(CliCommandVariable variable) {
    switch (variable.type) {
      case CliCommandVariableType.constant:
        return variable.value.split('=').skip(1).join('=');
      case CliCommandVariableType.dynamic:
        return _dynamicVariables[variable.key]!;
      case CliCommandVariableType.environment:
        return Platform.environment[variable.key]!;
    }
  }
}

class CurrentExecutedService {
  final String commitHash;
  final Process serverProcess;
  final String serverDirectory;

  CurrentExecutedService({
    required this.commitHash,
    required this.serverProcess,
    required this.serverDirectory,
  });
}
