// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fragment$CompilerLogF _$Fragment$CompilerLogFFromJson(
        Map<String, dynamic> json) =>
    Fragment$CompilerLogF(
      message: json['message'] as String,
      time: DateTime.parse(json['time'] as String),
      result: json['result'] == null
          ? null
          : Fragment$ProcessExecResultF.fromJson(
              json['result'] as Map<String, dynamic>),
      $__typename: json['__typename'] as String,
    );

Map<String, dynamic> _$Fragment$CompilerLogFToJson(
        Fragment$CompilerLogF instance) =>
    <String, dynamic>{
      'message': instance.message,
      'time': instance.time.toIso8601String(),
      'result': instance.result?.toJson(),
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
          .map((e) => Fragment$CompilerLogF.fromJson(e as Map<String, dynamic>))
          .toList(),
      $__typename: json['__typename'] as String,
    );

Map<String, dynamic> _$Mutation$startServiceToJson(
        Mutation$startService instance) =>
    <String, dynamic>{
      'startService': instance.startService.map((e) => e.toJson()).toList(),
      '__typename': instance.$__typename,
    };
