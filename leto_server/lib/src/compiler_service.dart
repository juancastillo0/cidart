import 'dart:io';

import 'compiler_models.dart';

class CompilerService {
  CompilerService({
    this.gitRepo = 'https://github.com/juancastillo0/room_signals',
    this.gitBranch = 'main',
    this.serverFile = 'bin/server',
  });
  final String gitRepo;
  final String gitBranch;
  final String serverFile;

  String? currentCommitId;
  Process? currentServerProcess;
  String? currentServerDirectory;

  bool starting = false;
  String workingDirectory = Directory.current.path;
  List<CompilerLog> compilationLogs = [];

  final Map<String, List<CompilerLog>> logs = {};

  Future<String?> topOutput() async {
    if (currentServerProcess == null) return null;
    final str = await _exec(
      'top',
      [
        ...Platform.isLinux ? ['-b', '-n2', '-p'] : ['-l2', '-pid'],
        '${currentServerProcess!.pid}',
      ],
    );
    final split = str.split('\n');
    return split.sublist((split.length / 2).floor()).join('\n');
  }

  Future<List<CompilerLog>> startService() async {
    if (starting) throw StateError('starting');
    starting = true;
    workingDirectory = Directory.current.path;
    String? commitId;

    void _onError(Object error, StackTrace stackTrace) {
      if (commitId != null && commitId != currentCommitId) {
        logs[commitId] = compilationLogs;
      }
      starting = false;
    }

    try {
      final now = DateTime.now();
      compilationLogs = [CompilerLog('starting compilation', time: now)];
      final commitResult =
          await _exec('git', ['ls-remote', gitRepo, 'refs/heads/$gitBranch']);
      commitId = commitResult.split(RegExp(r'\s+')).first;
      if (commitId == currentCommitId) {
        throw StateError('same commit: $commitId');
      }
      final dirName =
          '${gitRepo.split('/').last}-${now.millisecondsSinceEpoch}-${commitId.substring(0, 10)}';
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

    await _exec('git', ['clone', '--branch', gitBranch, gitRepo, dirName]);
    workingDirectory =
        '${Directory.current.path}${Platform.pathSeparator}$dirName';
    await _exec(dart, ['pub', 'get']);
    await _exec(dart, ['analyze']);
    await _exec(dart, ['test']);
    await _exec(
      dart,
      'compile exe $serverFile.dart --output $serverFile'.split(' '),
    );
  }

  Future<void> _initProcess(String commitId) async {
    if (currentServerProcess != null) {
      currentServerProcess!.kill();
      currentServerProcess = null;
    }
    try {
      currentServerProcess = await Process.start(
        serverFile,
        [],
        mode: ProcessStartMode.inheritStdio,
        workingDirectory: workingDirectory,
      );
      currentCommitId = commitId;
      logs[commitId] = compilationLogs;
      currentServerDirectory = workingDirectory;
      // TODO: delete directory
    } catch (_) {
      if (currentServerDirectory != null) {
        // restart previous process
        currentServerProcess = await Process.start(
          serverFile,
          [],
          mode: ProcessStartMode.inheritStdio,
          workingDirectory: currentServerDirectory,
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
      workingDirectory: workingDirectory,
    );
    compilationLogs.add(
      CompilerLog(
        'exec: $commandStr. Duration:${watch.elapsedMilliseconds}ms.',
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
}
