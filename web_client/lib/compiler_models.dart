import 'compiler_store.dart';

final compilations = [
  Compilation(
    commitHash: 'dwadanoawi829',
    gitBranch: 'main',
    gitRepo: 'juancastillo0/room_signals',
    serverFile: 'bin/server',
    startTime: DateTime.now(),
    status: CompilationStatus.started,
    logs: [
      CompilationLog(
        message: 'started',
        time: DateTime.now(),
      ),
    ],
  ),
  Compilation(
    commitHash: 'rytvxyawuinpbnclsaby',
    gitBranch: 'main',
    gitRepo: 'juancastillo0/room_signals',
    serverFile: 'bin/compilation_server',
    startTime: DateTime.now().subtract(Duration(hours: 3)),
    endTime: DateTime.now().subtract(Duration(hours: 4)),
    status: CompilationStatus.error,
    logs: [
      CompilationLog(
        message: 'started',
        time: DateTime.now().subtract(Duration(hours: 3)),
      ),
      CompilationLog(
        message: 'getting commit hash from git',
        time: DateTime.now().subtract(Duration(hours: 3)),
        command: CommandExecution(
          command: CliCommand()
            ..command = 'git repo juancastillo0/room_signals --branch=main'
            ..name = 'get_last_commit_hash',
          duration: Duration(hours: 1),
          endTime: DateTime.now().subtract(Duration(hours: 4)),
          status: CompilationStatus.error,
          result: ProcessResult(
            pid: 343,
            exitCode: 23,
            stdout: '',
            stderr: 'connection error',
          ),
        ),
      ),
    ],
  ),
];

class Compilation {
  final String gitRepo;
  final String gitBranch;
  final String serverFile;
  final String commitHash;
  final CompilationStatus status;
  final DateTime startTime;
  final DateTime? endTime;
  final List<CompilationLog> logs;

  Compilation({
    required this.gitRepo,
    required this.gitBranch,
    required this.serverFile,
    required this.commitHash,
    required this.status,
    required this.startTime,
    this.endTime,
    required this.logs,
  });
}

enum CompilationStatus {
  pending,
  started,
  error,
  success,
}

class CompilationLog {
  final CommandExecution? command;
  final DateTime time;
  final String message;

  CompilationLog({
    this.command,
    required this.time,
    required this.message,
  });
}

class CommandExecution {
  final CliCommand command;
  final Duration duration;
  final DateTime endTime;
  final ProcessResult? result;
  final CompilationStatus status;

  CommandExecution({
    required this.command,
    required this.duration,
    required this.endTime,
    this.result,
    required this.status,
  });
}

class ProcessResult {
  final int pid;
  final int exitCode;
  final String stdout;
  final String stderr;

  ProcessResult({
    required this.pid,
    required this.exitCode,
    required this.stdout,
    required this.stderr,
  });
}

class CliCommandVariable {
  final CliCommandVariableType type;
  final String value;

  CliCommandVariable(this.type, this.value);
}

enum CliCommandVariableType {
  environment,
  constant,
  dynamic,
}
