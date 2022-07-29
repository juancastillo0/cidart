import 'dart:io';

import 'package:leto_schema/leto_schema.dart';

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
  final String message;
  final DateTime time;
  final ProcessExecResult? result;

  CompilerLog(
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
