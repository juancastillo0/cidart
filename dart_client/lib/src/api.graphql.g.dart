// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fragment$CompilationLogF _$Fragment$CompilationLogFFromJson(
        Map<String, dynamic> json) =>
    Fragment$CompilationLogF(
      message: json['message'] as String,
      time: DateTime.parse(json['time'] as String),
      command: json['command'] == null
          ? null
          : Fragment$CompilationLogF$command.fromJson(
              json['command'] as Map<String, dynamic>),
      $__typename: json['__typename'] as String,
    );

Map<String, dynamic> _$Fragment$CompilationLogFToJson(
        Fragment$CompilationLogF instance) =>
    <String, dynamic>{
      'message': instance.message,
      'time': instance.time.toIso8601String(),
      'command': instance.command?.toJson(),
      '__typename': instance.$__typename,
    };

Fragment$CompilationLogF$command _$Fragment$CompilationLogF$commandFromJson(
        Map<String, dynamic> json) =>
    Fragment$CompilationLogF$command(
      result: json['result'] == null
          ? null
          : Fragment$ProcessExecResultF.fromJson(
              json['result'] as Map<String, dynamic>),
      $__typename: json['__typename'] as String,
    );

Map<String, dynamic> _$Fragment$CompilationLogF$commandToJson(
        Fragment$CompilationLogF$command instance) =>
    <String, dynamic>{
      'result': instance.result?.toJson(),
      '__typename': instance.$__typename,
    };

Fragment$CommandExecutionF _$Fragment$CommandExecutionFFromJson(
        Map<String, dynamic> json) =>
    Fragment$CommandExecutionF(
      command: Fragment$CommandExecutionF$command.fromJson(
          json['command'] as Map<String, dynamic>),
      status: $enumDecode(_$Enum$CompilationStatusEnumMap, json['status'],
          unknownValue: Enum$CompilationStatus.$unknown),
      durationMs: json['durationMs'] as int?,
      endTime: json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String),
      result: json['result'] == null
          ? null
          : Fragment$ProcessExecResultF.fromJson(
              json['result'] as Map<String, dynamic>),
      $__typename: json['__typename'] as String,
    );

Map<String, dynamic> _$Fragment$CommandExecutionFToJson(
        Fragment$CommandExecutionF instance) =>
    <String, dynamic>{
      'command': instance.command.toJson(),
      'status': _$Enum$CompilationStatusEnumMap[instance.status]!,
      'durationMs': instance.durationMs,
      'endTime': instance.endTime?.toIso8601String(),
      'result': instance.result?.toJson(),
      '__typename': instance.$__typename,
    };

const _$Enum$CompilationStatusEnumMap = {
  Enum$CompilationStatus.pending: 'pending',
  Enum$CompilationStatus.started: 'started',
  Enum$CompilationStatus.error: 'error',
  Enum$CompilationStatus.success: 'success',
  Enum$CompilationStatus.$unknown: r'$unknown',
};

Fragment$CommandExecutionF$command _$Fragment$CommandExecutionF$commandFromJson(
        Map<String, dynamic> json) =>
    Fragment$CommandExecutionF$command(
      name: json['name'] as String,
      command:
          (json['command'] as List<dynamic>).map((e) => e as String).toList(),
      modifiedDate: DateTime.parse(json['modifiedDate'] as String),
      $__typename: json['__typename'] as String,
    );

Map<String, dynamic> _$Fragment$CommandExecutionF$commandToJson(
        Fragment$CommandExecutionF$command instance) =>
    <String, dynamic>{
      'name': instance.name,
      'command': instance.command,
      'modifiedDate': instance.modifiedDate.toIso8601String(),
      '__typename': instance.$__typename,
    };

Fragment$ProcessExecResultF _$Fragment$ProcessExecResultFFromJson(
        Map<String, dynamic> json) =>
    Fragment$ProcessExecResultF(
      exitCode: json['exitCode'] as int,
      pid: json['pid'] as int,
      stderr: json['stderr'] as String,
      stdout: json['stdout'] as String,
      $__typename: json['__typename'] as String,
    );

Map<String, dynamic> _$Fragment$ProcessExecResultFToJson(
        Fragment$ProcessExecResultF instance) =>
    <String, dynamic>{
      'exitCode': instance.exitCode,
      'pid': instance.pid,
      'stderr': instance.stderr,
      'stdout': instance.stdout,
      '__typename': instance.$__typename,
    };

Query$topResult _$Query$topResultFromJson(Map<String, dynamic> json) =>
    Query$topResult(
      topOutput: json['topOutput'] as String?,
      $__typename: json['__typename'] as String,
    );

Map<String, dynamic> _$Query$topResultToJson(Query$topResult instance) =>
    <String, dynamic>{
      'topOutput': instance.topOutput,
      '__typename': instance.$__typename,
    };

Mutation$startService _$Mutation$startServiceFromJson(
        Map<String, dynamic> json) =>
    Mutation$startService(
      startService: (json['startService'] as List<dynamic>)
          .map((e) =>
              Fragment$CompilationLogF.fromJson(e as Map<String, dynamic>))
          .toList(),
      $__typename: json['__typename'] as String,
    );

Map<String, dynamic> _$Mutation$startServiceToJson(
        Mutation$startService instance) =>
    <String, dynamic>{
      'startService': instance.startService.map((e) => e.toJson()).toList(),
      '__typename': instance.$__typename,
    };
