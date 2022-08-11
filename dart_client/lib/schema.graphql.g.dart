// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Input$ServiceConfigInput _$Input$ServiceConfigInputFromJson(
        Map<String, dynamic> json) =>
    Input$ServiceConfigInput(
      gitRepo: json['gitRepo'] as String,
      gitBranch: json['gitBranch'] as String,
      serverFile: json['serverFile'] as String,
      commands: (json['commands'] as List<dynamic>)
          .map((e) => Input$CliCommandInput.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$Input$ServiceConfigInputToJson(
        Input$ServiceConfigInput instance) =>
    <String, dynamic>{
      'gitRepo': instance.gitRepo,
      'gitBranch': instance.gitBranch,
      'serverFile': instance.serverFile,
      'commands': instance.commands.map((e) => e.toJson()).toList(),
    };

Input$CliCommandInput _$Input$CliCommandInputFromJson(
        Map<String, dynamic> json) =>
    Input$CliCommandInput(
      name: json['name'] as String,
      command:
          (json['command'] as List<dynamic>).map((e) => e as String).toList(),
      variables: (json['variables'] as List<dynamic>)
          .map((e) =>
              Input$CliCommandVariableInput.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$Input$CliCommandInputToJson(
        Input$CliCommandInput instance) =>
    <String, dynamic>{
      'name': instance.name,
      'command': instance.command,
      'variables': instance.variables.map((e) => e.toJson()).toList(),
    };

Input$CliCommandVariableInput _$Input$CliCommandVariableInputFromJson(
        Map<String, dynamic> json) =>
    Input$CliCommandVariableInput(
      type: $enumDecode(_$Enum$CliCommandVariableTypeEnumMap, json['type'],
          unknownValue: Enum$CliCommandVariableType.$unknown),
      value: json['value'] as String,
    );

Map<String, dynamic> _$Input$CliCommandVariableInputToJson(
        Input$CliCommandVariableInput instance) =>
    <String, dynamic>{
      'type': _$Enum$CliCommandVariableTypeEnumMap[instance.type]!,
      'value': instance.value,
    };

const _$Enum$CliCommandVariableTypeEnumMap = {
  Enum$CliCommandVariableType.environment: 'environment',
  Enum$CliCommandVariableType.constant: 'constant',
  Enum$CliCommandVariableType.$dynamic: 'dynamic',
  Enum$CliCommandVariableType.$unknown: r'$unknown',
};

Input$CompilationFilter _$Input$CompilationFilterFromJson(
        Map<String, dynamic> json) =>
    Input$CompilationFilter(
      serviceConfig: json['serviceConfig'] == null
          ? null
          : Input$ServiceConfigFilter.fromJson(
              json['serviceConfig'] as Map<String, dynamic>),
      commitHash: json['commitHash'] == null
          ? null
          : Input$StringFilter.fromJson(
              json['commitHash'] as Map<String, dynamic>),
      statusIsIn: (json['statusIsIn'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$Enum$CompilationStatusEnumMap, e,
              unknownValue: Enum$CompilationStatus.$unknown))
          .toList(),
      startTime: json['startTime'] == null
          ? null
          : Input$DateTimeFilter.fromJson(
              json['startTime'] as Map<String, dynamic>),
      endTime: json['endTime'] == null
          ? null
          : Input$DateTimeFilter.fromJson(
              json['endTime'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$Input$CompilationFilterToJson(
        Input$CompilationFilter instance) =>
    <String, dynamic>{
      'serviceConfig': instance.serviceConfig?.toJson(),
      'commitHash': instance.commitHash?.toJson(),
      'statusIsIn': instance.statusIsIn
          ?.map((e) => _$Enum$CompilationStatusEnumMap[e]!)
          .toList(),
      'startTime': instance.startTime?.toJson(),
      'endTime': instance.endTime?.toJson(),
    };

const _$Enum$CompilationStatusEnumMap = {
  Enum$CompilationStatus.pending: 'pending',
  Enum$CompilationStatus.started: 'started',
  Enum$CompilationStatus.error: 'error',
  Enum$CompilationStatus.success: 'success',
  Enum$CompilationStatus.$unknown: r'$unknown',
};

Input$ServiceConfigFilter _$Input$ServiceConfigFilterFromJson(
        Map<String, dynamic> json) =>
    Input$ServiceConfigFilter(
      serviceId: json['serviceId'] == null
          ? null
          : Input$StringFilter.fromJson(
              json['serviceId'] as Map<String, dynamic>),
      gitRepo: json['gitRepo'] == null
          ? null
          : Input$StringFilter.fromJson(
              json['gitRepo'] as Map<String, dynamic>),
      gitBranch: json['gitBranch'] == null
          ? null
          : Input$StringFilter.fromJson(
              json['gitBranch'] as Map<String, dynamic>),
      serverFile: json['serverFile'] == null
          ? null
          : Input$StringFilter.fromJson(
              json['serverFile'] as Map<String, dynamic>),
      createdDate: json['createdDate'] == null
          ? null
          : Input$DateTimeFilter.fromJson(
              json['createdDate'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$Input$ServiceConfigFilterToJson(
        Input$ServiceConfigFilter instance) =>
    <String, dynamic>{
      'serviceId': instance.serviceId?.toJson(),
      'gitRepo': instance.gitRepo?.toJson(),
      'gitBranch': instance.gitBranch?.toJson(),
      'serverFile': instance.serverFile?.toJson(),
      'createdDate': instance.createdDate?.toJson(),
    };

Input$StringFilter _$Input$StringFilterFromJson(Map<String, dynamic> json) =>
    Input$StringFilter(
      contains: json['contains'] as String?,
      regExp: json['regExp'] as String?,
      isIn: (json['isIn'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$Input$StringFilterToJson(Input$StringFilter instance) =>
    <String, dynamic>{
      'contains': instance.contains,
      'regExp': instance.regExp,
      'isIn': instance.isIn,
    };

Input$DateTimeFilter _$Input$DateTimeFilterFromJson(
        Map<String, dynamic> json) =>
    Input$DateTimeFilter(
      before: json['before'] == null
          ? null
          : DateTime.parse(json['before'] as String),
      after: json['after'] == null
          ? null
          : DateTime.parse(json['after'] as String),
    );

Map<String, dynamic> _$Input$DateTimeFilterToJson(
        Input$DateTimeFilter instance) =>
    <String, dynamic>{
      'before': instance.before?.toIso8601String(),
      'after': instance.after?.toIso8601String(),
    };
