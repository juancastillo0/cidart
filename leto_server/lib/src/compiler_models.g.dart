// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compiler_models.dart';

// **************************************************************************
// _GraphQLGenerator
// **************************************************************************

final _processExecResultGraphQLType =
    HotReloadableDefinition<GraphQLObjectType<ProcessExecResult>>((setValue) {
  final __name = 'ProcessExecResult';

  final __processExecResultGraphQLType =
      objectType<ProcessExecResult>(__name, isInterface: false, interfaces: []);

  setValue(__processExecResultGraphQLType);
  __processExecResultGraphQLType.fields.addAll(
    [
      graphQLInt
          .nonNull()
          .field('exitCode', resolve: (obj, ctx) => obj.exitCode),
      graphQLInt.nonNull().field('pid', resolve: (obj, ctx) => obj.pid),
      graphQLString
          .nonNull()
          .field('stderr', resolve: (obj, ctx) => obj.stderr),
      graphQLString.nonNull().field('stdout', resolve: (obj, ctx) => obj.stdout)
    ],
  );

  return __processExecResultGraphQLType;
});

/// Auto-generated from [ProcessExecResult].
GraphQLObjectType<ProcessExecResult> get processExecResultGraphQLType =>
    _processExecResultGraphQLType.value;

final _compilationGraphQLType =
    HotReloadableDefinition<GraphQLObjectType<Compilation>>((setValue) {
  final __name = 'Compilation';

  final __compilationGraphQLType =
      objectType<Compilation>(__name, isInterface: false, interfaces: []);

  setValue(__compilationGraphQLType);
  __compilationGraphQLType.fields.addAll(
    [
      serviceConfigGraphQLType
          .nonNull()
          .field('serviceConfig', resolve: (obj, ctx) => obj.serviceConfig),
      graphQLString
          .nonNull()
          .field('commitHash', resolve: (obj, ctx) => obj.commitHash),
      compilationStatusGraphQLType
          .nonNull()
          .field('status', resolve: (obj, ctx) => obj.status),
      graphQLDate
          .nonNull()
          .field('startTime', resolve: (obj, ctx) => obj.startTime),
      graphQLDate.field('endTime', resolve: (obj, ctx) => obj.endTime),
      compilationLogGraphQLType
          .nonNull()
          .list()
          .nonNull()
          .field('logs', resolve: (obj, ctx) => obj.logs)
    ],
  );

  return __compilationGraphQLType;
});

/// Auto-generated from [Compilation].
GraphQLObjectType<Compilation> get compilationGraphQLType =>
    _compilationGraphQLType.value;

final _compilationLogGraphQLType =
    HotReloadableDefinition<GraphQLObjectType<CompilationLog>>((setValue) {
  final __name = 'CompilationLog';

  final __compilationLogGraphQLType =
      objectType<CompilationLog>(__name, isInterface: false, interfaces: []);

  setValue(__compilationLogGraphQLType);
  __compilationLogGraphQLType.fields.addAll(
    [
      graphQLInt.nonNull().field('id', resolve: (obj, ctx) => obj.id),
      commandExecutionGraphQLType.field('command',
          resolve: (obj, ctx) => obj.command),
      graphQLDate.nonNull().field('time', resolve: (obj, ctx) => obj.time),
      graphQLString
          .nonNull()
          .field('message', resolve: (obj, ctx) => obj.message)
    ],
  );

  return __compilationLogGraphQLType;
});

/// Auto-generated from [CompilationLog].
GraphQLObjectType<CompilationLog> get compilationLogGraphQLType =>
    _compilationLogGraphQLType.value;

final _commandExecutionGraphQLType =
    HotReloadableDefinition<GraphQLObjectType<CommandExecution>>((setValue) {
  final __name = 'CommandExecution';

  final __commandExecutionGraphQLType =
      objectType<CommandExecution>(__name, isInterface: false, interfaces: []);

  setValue(__commandExecutionGraphQLType);
  __commandExecutionGraphQLType.fields.addAll(
    [
      cliCommandGraphQLType
          .nonNull()
          .field('command', resolve: (obj, ctx) => obj.command),
      compilationStatusGraphQLType
          .nonNull()
          .field('status', resolve: (obj, ctx) => obj.status),
      graphQLInt.field('durationMs', resolve: (obj, ctx) => obj.durationMs),
      graphQLDate.field('endTime', resolve: (obj, ctx) => obj.endTime),
      processExecResultGraphQLType.field('result',
          resolve: (obj, ctx) => obj.result)
    ],
  );

  return __commandExecutionGraphQLType;
});

/// Auto-generated from [CommandExecution].
GraphQLObjectType<CommandExecution> get commandExecutionGraphQLType =>
    _commandExecutionGraphQLType.value;

final cliCommandVariableSerializer = SerializerValue<CliCommandVariable>(
  key: "CliCommandVariable",
  fromJson: (ctx, json) =>
      CliCommandVariable.fromJson(json), // _$CliCommandVariableFromJson,
  // toJson: (m) => _$CliCommandVariableToJson(m as CliCommandVariable),
);
final _cliCommandVariableGraphQLType =
    HotReloadableDefinition<GraphQLObjectType<CliCommandVariable>>((setValue) {
  final __name = 'CliCommandVariable';

  final __cliCommandVariableGraphQLType = objectType<CliCommandVariable>(__name,
      isInterface: false, interfaces: []);

  setValue(__cliCommandVariableGraphQLType);
  __cliCommandVariableGraphQLType.fields.addAll(
    [
      cliCommandVariableTypeGraphQLType
          .nonNull()
          .field('type', resolve: (obj, ctx) => obj.type),
      graphQLString
          .nonNull()
          .field('value', resolve: (obj, ctx) => obj.value, attachments: [
        ValidaAttachment(ValidaString(minLength: 1)),
      ]),
      graphQLString.nonNull().field('key', resolve: (obj, ctx) => obj.key)
    ],
  );

  return __cliCommandVariableGraphQLType;
});

/// Auto-generated from [CliCommandVariable].
GraphQLObjectType<CliCommandVariable> get cliCommandVariableGraphQLType =>
    _cliCommandVariableGraphQLType.value;
final _cliCommandVariableGraphQLTypeInput =
    HotReloadableDefinition<GraphQLInputObjectType<CliCommandVariable>>(
        (setValue) {
  final __name = 'CliCommandVariableInput';

  final __cliCommandVariableGraphQLTypeInput =
      inputObjectType<CliCommandVariable>(__name);

  setValue(__cliCommandVariableGraphQLTypeInput);
  __cliCommandVariableGraphQLTypeInput.fields.addAll(
    [
      cliCommandVariableTypeGraphQLType.nonNull().inputField('type'),
      graphQLString.nonNull().inputField('value', attachments: [
        ValidaAttachment(ValidaString(minLength: 1)),
      ])
    ],
  );

  return __cliCommandVariableGraphQLTypeInput;
});

/// Auto-generated from [CliCommandVariable].
GraphQLInputObjectType<CliCommandVariable>
    get cliCommandVariableGraphQLTypeInput =>
        _cliCommandVariableGraphQLTypeInput.value;

final cliCommandSerializer = SerializerValue<CliCommand>(
  key: "CliCommand",
  fromJson: (ctx, json) => CliCommand.fromJson(json), // _$CliCommandFromJson,
  // toJson: (m) => _$CliCommandToJson(m as CliCommand),
);
final _cliCommandGraphQLType =
    HotReloadableDefinition<GraphQLObjectType<CliCommand>>((setValue) {
  final __name = 'CliCommand';

  final __cliCommandGraphQLType =
      objectType<CliCommand>(__name, isInterface: false, interfaces: []);

  setValue(__cliCommandGraphQLType);
  __cliCommandGraphQLType.fields.addAll(
    [
      graphQLString.nonNull().field('name', resolve: (obj, ctx) => obj.name),
      graphQLString
          .nonNull()
          .list()
          .nonNull()
          .field('command', resolve: (obj, ctx) => obj.command),
      graphQLDate
          .nonNull()
          .field('modifiedDate', resolve: (obj, ctx) => obj.modifiedDate),
      cliCommandVariableGraphQLType
          .nonNull()
          .list()
          .nonNull()
          .field('variables', resolve: (obj, ctx) => obj.variables)
    ],
  );

  return __cliCommandGraphQLType;
});

/// Auto-generated from [CliCommand].
GraphQLObjectType<CliCommand> get cliCommandGraphQLType =>
    _cliCommandGraphQLType.value;

final serviceConfigSerializer = SerializerValue<ServiceConfig>(
  key: "ServiceConfig",
  fromJson: (ctx, json) =>
      ServiceConfig.fromJson(json), // _$ServiceConfigFromJson,
  // toJson: (m) => _$ServiceConfigToJson(m as ServiceConfig),
);
final _serviceConfigGraphQLType =
    HotReloadableDefinition<GraphQLObjectType<ServiceConfig>>((setValue) {
  final __name = 'ServiceConfig';

  final __serviceConfigGraphQLType =
      objectType<ServiceConfig>(__name, isInterface: false, interfaces: []);

  setValue(__serviceConfigGraphQLType);
  __serviceConfigGraphQLType.fields.addAll(
    [
      graphQLString
          .nonNull()
          .field('serviceId', resolve: (obj, ctx) => obj.serviceId),
      graphQLString
          .nonNull()
          .field('gitRepo', resolve: (obj, ctx) => obj.gitRepo),
      graphQLString
          .nonNull()
          .field('gitBranch', resolve: (obj, ctx) => obj.gitBranch),
      graphQLString
          .nonNull()
          .field('serverFile', resolve: (obj, ctx) => obj.serverFile),
      cliCommandGraphQLType
          .nonNull()
          .list()
          .nonNull()
          .field('commands', resolve: (obj, ctx) => obj.commands),
      graphQLDate
          .nonNull()
          .field('createdDate', resolve: (obj, ctx) => obj.createdDate)
    ],
  );

  return __serviceConfigGraphQLType;
});

/// Auto-generated from [ServiceConfig].
GraphQLObjectType<ServiceConfig> get serviceConfigGraphQLType =>
    _serviceConfigGraphQLType.value;

/// Auto-generated from [CompilationStatus].
final GraphQLEnumType<CompilationStatus> compilationStatusGraphQLType =
    GraphQLEnumType('CompilationStatus', [
  GraphQLEnumValue('pending', CompilationStatus.pending),
  GraphQLEnumValue('started', CompilationStatus.started),
  GraphQLEnumValue('error', CompilationStatus.error),
  GraphQLEnumValue('success', CompilationStatus.success)
]);

/// Auto-generated from [CliCommandVariableType].
final GraphQLEnumType<CliCommandVariableType>
    cliCommandVariableTypeGraphQLType =
    GraphQLEnumType('CliCommandVariableType', [
  GraphQLEnumValue('environment', CliCommandVariableType.environment),
  GraphQLEnumValue('constant', CliCommandVariableType.constant),
  GraphQLEnumValue('execution', CliCommandVariableType.execution)
]);

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CliCommandVariable _$CliCommandVariableFromJson(Map<String, dynamic> json) =>
    CliCommandVariable(
      $enumDecode(_$CliCommandVariableTypeEnumMap, json['type']),
      json['value'] as String,
    );

Map<String, dynamic> _$CliCommandVariableToJson(CliCommandVariable instance) =>
    <String, dynamic>{
      'type': _$CliCommandVariableTypeEnumMap[instance.type]!,
      'value': instance.value,
    };

const _$CliCommandVariableTypeEnumMap = {
  CliCommandVariableType.environment: 'environment',
  CliCommandVariableType.constant: 'constant',
  CliCommandVariableType.execution: 'execution',
};

CliCommand _$CliCommandFromJson(Map<String, dynamic> json) => CliCommand(
      name: json['name'] as String,
      command:
          (json['command'] as List<dynamic>).map((e) => e as String).toList(),
      modifiedDate: DateTime.parse(json['modifiedDate'] as String),
      variables: (json['variables'] as List<dynamic>)
          .map((e) => CliCommandVariable.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CliCommandToJson(CliCommand instance) =>
    <String, dynamic>{
      'name': instance.name,
      'command': instance.command,
      'modifiedDate': instance.modifiedDate.toIso8601String(),
      'variables': instance.variables,
    };

ServiceConfig _$ServiceConfigFromJson(Map<String, dynamic> json) =>
    ServiceConfig(
      serviceId: json['serviceId'] as String,
      gitRepo: json['gitRepo'] as String,
      gitBranch: json['gitBranch'] as String,
      serverFile: json['serverFile'] as String,
      commands: (json['commands'] as List<dynamic>)
          .map((e) => CliCommand.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdDate: DateTime.parse(json['createdDate'] as String),
    );

Map<String, dynamic> _$ServiceConfigToJson(ServiceConfig instance) =>
    <String, dynamic>{
      'serviceId': instance.serviceId,
      'gitRepo': instance.gitRepo,
      'gitBranch': instance.gitBranch,
      'serverFile': instance.serverFile,
      'commands': instance.commands,
      'createdDate': instance.createdDate.toIso8601String(),
    };

// **************************************************************************
// ValidatorGenerator
// **************************************************************************

enum CliCommandVariableField {
  value,
}

class CliCommandVariableValidationFields {
  const CliCommandVariableValidationFields(this.errorsMap);
  final Map<CliCommandVariableField, List<ValidaError>> errorsMap;

  List<ValidaError> get value =>
      errorsMap[CliCommandVariableField.value] ?? const [];
}

class CliCommandVariableValidation
    extends Validation<CliCommandVariable, CliCommandVariableField> {
  CliCommandVariableValidation(this.errorsMap, this.value)
      : fields = CliCommandVariableValidationFields(errorsMap),
        super(errorsMap);
  @override
  final Map<CliCommandVariableField, List<ValidaError>> errorsMap;
  @override
  final CliCommandVariable value;
  @override
  final CliCommandVariableValidationFields fields;

  /// Validates [value] and returns a [CliCommandVariableValidation] with the errors found as a result
  factory CliCommandVariableValidation.fromValue(CliCommandVariable value) =>
      spec.validate(value);

  static const spec = ValidaSpec(
    globalValidate: null,
    validationFactory: CliCommandVariableValidation.new,
    getField: _getField,
    fieldsMap: {
      CliCommandVariableField.value: ValidaString(minLength: 1),
    },
  );

  static List<ValidaError> _globalValidate(CliCommandVariable value) => [];

  static Object? _getField(CliCommandVariable value, String field) {
    switch (field) {
      case 'type':
        return value.type;
      case 'value':
        return value.value;
      case 'key':
        return value.key;
      case 'hashCode':
        return value.hashCode;
      case 'runtimeType':
        return value.runtimeType;
      default:
        throw Exception('Could not find field "$field" for value $value.');
    }
  }
}
