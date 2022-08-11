import 'dart:convert' show jsonEncode;
import 'dart:io';

import 'package:json_annotation/json_annotation.dart';
import 'package:leto_schema/leto_schema.dart';
import 'package:valida/valida.dart';

part 'compiler_models.g.dart';

class ExecException implements Exception {
  final ProcessResult result;
  final String? context;

  ExecException({
    required this.result,
    this.context,
  });

  @override
  String toString() {
    return 'ExecException(${context == null ? '' : 'context: $context, '}'
        'result: ${processResultToJson(result)})';
  }
}

Map<String, Object?> processResultToJson(ProcessResult result) {
  return {
    'exitCode': result.exitCode,
    'pid': result.pid,
    'stderr': result.stderr,
    'stdout': result.stdout,
  };
}

@GraphQLClass()
class CompilerLog {
  final int id;
  final String message;
  final DateTime time;
  final ProcessExecResult? result;

  CompilerLog(
    this.id,
    this.message, {
    DateTime? time,
    this.result,
  }) : time = time ?? DateTime.now();

  @override
  String toString() {
    final resultStr =
        result == null ? '' : ', result: ${processResultToJson(result!)}';
    return 'CompilerLog(message: $message, time: $time$resultStr)';
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'time': time.toIso8601String(),
      'result': result == null ? null : processResultToJson(result!),
    };
  }

  factory CompilerLog.fromJson(Map<String, dynamic> map) {
    final result = map['result'] as Map<String, Object?>?;
    return CompilerLog(
      map['id'] as int,
      map['message'] as String,
      time: DateTime.parse(map['time'] as String),
      result: result != null
          ? ProcessExecResult(
              pid: result['pid'] as int,
              exitCode: result['exitCode'] as int,
              stdout: result['stdout'] as String,
              stderr: result['stderr'] as String,
            )
          : null,
    );
  }
}

@GraphQLClass()
class ProcessExecResult implements ProcessResult {
  @override
  final int exitCode;
  @override
  final int pid;
  @override
  final String stderr;
  @override
  final String stdout;

  const ProcessExecResult({
    required this.exitCode,
    required this.pid,
    required this.stderr,
    required this.stdout,
  });

  ProcessExecResult.fromResult(ProcessResult result)
      : exitCode = result.exitCode,
        pid = result.pid,
        stderr = result.stderr,
        stdout = result.stdout;
}

final compilationsListMock = [
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
          command: CliCommand(
            command: 'git repo juancastillo0/room_signals --branch=main',
            name: 'get_last_commit_hash',
            variables: [],
            modifiedDate: DateTime.now().subtract(Duration(hours: 6)),
          ),
          durationMs: Duration(hours: 1).inMilliseconds,
          endTime: DateTime.now().subtract(Duration(hours: 4)),
          status: CompilationStatus.error,
          result: ProcessExecResult(
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

@GraphQLClass()
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

@GraphQLEnum()
enum CompilationStatus {
  pending,
  started,
  error,
  success,
}

@GraphQLClass()
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

@GraphQLClass()
class CommandExecution {
  final CliCommand command;
  final CompilationStatus status;

  final int? durationMs;
  final DateTime? endTime;
  // TODO: make this non nullable and send stdout and stderr in deltas
  final ProcessExecResult? result;

  CommandExecution({
    required this.command,
    required this.durationMs,
    required this.endTime,
    this.result,
    required this.status,
  });
}

@Valida()
@JsonSerializable()
@GraphQLClass()
@GraphQLInput()
@Valida(customValidate: CliCommandVariable.validateValue)
class CliCommandVariable {
  final CliCommandVariableType type;
  // TODO: @ValidaString() not in serviceId, gitRepo, gitBranch, serverFile
  @ValidaString(minLength: 1)
  final String value;

  String get key =>
      type == CliCommandVariableType.constant ? value.split('=').first : value;

  static List<ValidaError> validateValue(Object? _obj) {
    final obj = _obj as CliCommandVariable;
    const dynamicVariableKeys = [
      'serviceId',
      'gitRepo',
      'gitBranch',
      'serverFile',
    ];
    return [
      // TODO: don't use the "=" for constants. Use separate key and value fields
      if (obj.type == CliCommandVariableType.constant &&
          !obj.value.contains('='))
        ValidaError(
          property: CliCommandVariableField.value.name,
          value: obj.value,
          errorCode: 'CliCommandVariable.constantNoEqual',
          message: 'A constant variable should have an "=" separator',
        ),
      if (obj.type == CliCommandVariableType.dynamic &&
          !dynamicVariableKeys.contains(obj.value))
        ValidaError(
          property: CliCommandVariableField.value.name,
          value: obj.value,
          errorCode: 'CliCommandVariable.dynamicNotFound',
          message:
              'A dynamic variable should be one of "${dynamicVariableKeys.join('", "')}"',
        ),
    ];
  }

  CliCommandVariable(this.type, this.value);

  factory CliCommandVariable.fromJson(Map<String, Object?> json) =>
      _$CliCommandVariableFromJson(json);
  Map<String, Object?> toJson() => _$CliCommandVariableToJson(this);
}

@GraphQLEnum()
enum CliCommandVariableType {
  environment,
  constant,
  dynamic,
}

@JsonSerializable()
@GraphQLClass()
class CliCommand {
  final String name;
  final String command;
  final DateTime modifiedDate;
  final List<CliCommandVariable> variables;

  const CliCommand({
    required this.name,
    required this.command,
    required this.modifiedDate,
    required this.variables,
  });

  @GraphQLField(omit: true)
  Map<String, CliCommandVariable> variablesMap() => Map.fromIterables(
        variables.map((e) => e.key),
        variables,
      );

  factory CliCommand.fromJson(Map<String, Object?> json) =>
      _$CliCommandFromJson(json);
  Map<String, Object?> toJson() => _$CliCommandToJson(this);

  /// TODO: this should not be exposed by default
  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
@GraphQLObject()
class ServiceConfig {
  final String serviceId;
  final String gitRepo;
  final String gitBranch;
  final String serverFile;
  // TODO: List<CliCommandInput> commands was not thorowing
  final List<CliCommand> commands;
  final DateTime createdDate;

  const ServiceConfig({
    required this.serviceId,
    required this.gitRepo,
    required this.gitBranch,
    required this.serverFile,
    required this.commands,
    required this.createdDate,
  });

  @GraphQLField(omit: true)
  Map<String, String> get dynamicVariables => {
        '\${serviceId}': serviceId,
        '\${gitRepo}': gitRepo,
        '\${gitBranch}': gitBranch,
        '\${serverFile}': serverFile,
      };

  factory ServiceConfig.fromJson(Map<String, Object?> json) =>
      _$ServiceConfigFromJson(json);
  Map<String, Object?> toJson() => _$ServiceConfigToJson(this);
}
