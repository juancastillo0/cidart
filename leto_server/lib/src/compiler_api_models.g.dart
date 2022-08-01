// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compiler_api_models.dart';

// **************************************************************************
// _GraphQLGenerator
// **************************************************************************

final serviceConfigInputSerializer = SerializerValue<ServiceConfigInput>(
  key: "ServiceConfigInput",
  fromJson: (ctx, json) => ServiceConfigInput.fromJson(json), // _$$FromJson,
  // toJson: (m) => _$$ToJson(m as _$),
);
final _serviceConfigInputGraphQLTypeInput =
    HotReloadableDefinition<GraphQLInputObjectType<ServiceConfigInput>>(
        (setValue) {
  final __name = 'ServiceConfigInput';

  final __serviceConfigInputGraphQLTypeInput =
      inputObjectType<ServiceConfigInput>(__name);

  setValue(__serviceConfigInputGraphQLTypeInput);
  __serviceConfigInputGraphQLTypeInput.fields.addAll(
    [
      graphQLString.nonNull().inputField('gitRepo', attachments: [
        ValidaAttachment(ValidaString(
            matches:
                r'^https://github.com/([a-zA-Z0-9\-\_]+)/([a-zA-Z0-9\-\_]+)$',
            isUrl: true)),
      ]),
      graphQLString.nonNull().inputField('gitBranch', attachments: [
        ValidaAttachment(ValidaString(matches: GIT_BRANCH_REGEXP)),
      ]),
      graphQLString.nonNull().inputField('serverFile', attachments: [
        ValidaAttachment(ValidaString(
            matches: r'^[a-zA-Z0-9\_\.]([a-zA-Z0-9\-\_/\.]+)[a-zA-Z0-9]$')),
      ]),
      cliCommandInputGraphQLTypeInput
          .nonNull()
          .list()
          .nonNull()
          .inputField('commands', attachments: [
        ValidaAttachment(ValidaList(
            description: 'The command names should be unique',
            customValidate: ServiceConfigInput.validateCommands,
            each: ValidaNested(
                overrideValidation: CliCommandInputValidation.fromValue))),
      ])
    ],
  );

  return __serviceConfigInputGraphQLTypeInput;
});

/// Auto-generated from [ServiceConfigInput].
GraphQLInputObjectType<ServiceConfigInput>
    get serviceConfigInputGraphQLTypeInput =>
        _serviceConfigInputGraphQLTypeInput.value;

final cliCommandInputSerializer = SerializerValue<CliCommandInput>(
  key: "CliCommandInput",
  fromJson: (ctx, json) => CliCommandInput.fromJson(json), // _$$FromJson,
  // toJson: (m) => _$$ToJson(m as _$),
);
final _cliCommandInputGraphQLTypeInput =
    HotReloadableDefinition<GraphQLInputObjectType<CliCommandInput>>(
        (setValue) {
  final __name = 'CliCommandInput';

  final __cliCommandInputGraphQLTypeInput =
      inputObjectType<CliCommandInput>(__name);

  setValue(__cliCommandInputGraphQLTypeInput);
  __cliCommandInputGraphQLTypeInput.fields.addAll(
    [
      graphQLString.nonNull().inputField('name'),
      graphQLString.nonNull().inputField('command', attachments: [
        ValidaAttachment(ValidaString(matches: r'^([^\s]+.*[^\s]+|[^\s]{1})$')),
      ]),
      cliCommandVariableGraphQLTypeInput
          .nonNull()
          .list()
          .nonNull()
          .inputField('variables', defaultValue: const [], attachments: [
        ValidaAttachment(
            ValidaList(customValidate: CliCommandInput.validateVariables)),
      ])
    ],
  );

  return __cliCommandInputGraphQLTypeInput;
});

/// Auto-generated from [CliCommandInput].
GraphQLInputObjectType<CliCommandInput> get cliCommandInputGraphQLTypeInput =>
    _cliCommandInputGraphQLTypeInput.value;

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
          .field('commands', resolve: (obj, ctx) => obj.commands)
    ],
  );

  return __serviceConfigGraphQLType;
});

/// Auto-generated from [ServiceConfig].
GraphQLObjectType<ServiceConfig> get serviceConfigGraphQLType =>
    _serviceConfigGraphQLType.value;

final compilationFilterSerializer = SerializerValue<CompilationFilter>(
  key: "CompilationFilter",
  fromJson: (ctx, json) => CompilationFilter.fromJson(json), // _$$FromJson,
  // toJson: (m) => _$$ToJson(m as _$),
);
final _compilationFilterGraphQLTypeInput =
    HotReloadableDefinition<GraphQLInputObjectType<CompilationFilter>>(
        (setValue) {
  final __name = 'CompilationFilter';

  final __compilationFilterGraphQLTypeInput =
      inputObjectType<CompilationFilter>(__name);

  setValue(__compilationFilterGraphQLTypeInput);
  __compilationFilterGraphQLTypeInput.fields.addAll(
    [
      stringFilterGraphQLTypeInput.inputField('gitRepo'),
      stringFilterGraphQLTypeInput.inputField('gitBranch'),
      stringFilterGraphQLTypeInput.inputField('serverFile'),
      stringFilterGraphQLTypeInput.inputField('commitHash'),
      compilationStatusGraphQLType.nonNull().list().inputField('statusIsIn'),
      dateTimeFilterGraphQLTypeInput.inputField('startTime'),
      dateTimeFilterGraphQLTypeInput.inputField('endTime')
    ],
  );

  return __compilationFilterGraphQLTypeInput;
});

/// Auto-generated from [CompilationFilter].
GraphQLInputObjectType<CompilationFilter>
    get compilationFilterGraphQLTypeInput =>
        _compilationFilterGraphQLTypeInput.value;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceConfigInput _$ServiceConfigInputFromJson(Map<String, dynamic> json) =>
    ServiceConfigInput(
      gitRepo: json['gitRepo'] as String,
      gitBranch: json['gitBranch'] as String,
      serverFile: json['serverFile'] as String,
      commands: (json['commands'] as List<dynamic>)
          .map((e) => CliCommandInput.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ServiceConfigInputToJson(ServiceConfigInput instance) =>
    <String, dynamic>{
      'gitRepo': instance.gitRepo,
      'gitBranch': instance.gitBranch,
      'serverFile': instance.serverFile,
      'commands': instance.commands,
    };

CliCommandInput _$CliCommandInputFromJson(Map<String, dynamic> json) =>
    CliCommandInput(
      name: json['name'] as String,
      command: json['command'] as String,
      variables: (json['variables'] as List<dynamic>?)
              ?.map(
                  (e) => CliCommandVariable.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$CliCommandInputToJson(CliCommandInput instance) =>
    <String, dynamic>{
      'name': instance.name,
      'command': instance.command,
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
    );

Map<String, dynamic> _$ServiceConfigToJson(ServiceConfig instance) =>
    <String, dynamic>{
      'serviceId': instance.serviceId,
      'gitRepo': instance.gitRepo,
      'gitBranch': instance.gitBranch,
      'serverFile': instance.serverFile,
      'commands': instance.commands,
    };

CompilationFilter _$CompilationFilterFromJson(Map<String, dynamic> json) =>
    CompilationFilter(
      gitRepo: json['gitRepo'] == null
          ? null
          : StringFilter.fromJson(json['gitRepo'] as Map<String, dynamic>),
      gitBranch: json['gitBranch'] == null
          ? null
          : StringFilter.fromJson(json['gitBranch'] as Map<String, dynamic>),
      serverFile: json['serverFile'] == null
          ? null
          : StringFilter.fromJson(json['serverFile'] as Map<String, dynamic>),
      commitHash: json['commitHash'] == null
          ? null
          : StringFilter.fromJson(json['commitHash'] as Map<String, dynamic>),
      statusIsIn: (json['statusIsIn'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$CompilationStatusEnumMap, e))
          .toList(),
      startTime: json['startTime'] == null
          ? null
          : DateTimeFilter.fromJson(json['startTime'] as Map<String, dynamic>),
      endTime: json['endTime'] == null
          ? null
          : DateTimeFilter.fromJson(json['endTime'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CompilationFilterToJson(CompilationFilter instance) =>
    <String, dynamic>{
      'gitRepo': instance.gitRepo,
      'gitBranch': instance.gitBranch,
      'serverFile': instance.serverFile,
      'commitHash': instance.commitHash,
      'statusIsIn': instance.statusIsIn
          ?.map((e) => _$CompilationStatusEnumMap[e]!)
          .toList(),
      'startTime': instance.startTime,
      'endTime': instance.endTime,
    };

const _$CompilationStatusEnumMap = {
  CompilationStatus.pending: 'pending',
  CompilationStatus.started: 'started',
  CompilationStatus.error: 'error',
  CompilationStatus.success: 'success',
};

// **************************************************************************
// ValidatorGenerator
// **************************************************************************

enum ServiceConfigInputField {
  gitRepo,
  gitBranch,
  serverFile,
  commands,
}

class ServiceConfigInputValidationFields {
  const ServiceConfigInputValidationFields(this.errorsMap);
  final Map<ServiceConfigInputField, List<ValidaError>> errorsMap;

  List<ValidaError> get gitRepo =>
      errorsMap[ServiceConfigInputField.gitRepo] ?? const [];
  List<ValidaError> get gitBranch =>
      errorsMap[ServiceConfigInputField.gitBranch] ?? const [];
  List<ValidaError> get serverFile =>
      errorsMap[ServiceConfigInputField.serverFile] ?? const [];
  List<ValidaError> get commands =>
      errorsMap[ServiceConfigInputField.commands] ?? const [];
}

class ServiceConfigInputValidation
    extends Validation<ServiceConfigInput, ServiceConfigInputField> {
  ServiceConfigInputValidation(this.errorsMap, this.value)
      : fields = ServiceConfigInputValidationFields(errorsMap),
        super(errorsMap);
  @override
  final Map<ServiceConfigInputField, List<ValidaError>> errorsMap;
  @override
  final ServiceConfigInput value;
  @override
  final ServiceConfigInputValidationFields fields;

  /// Validates [value] and returns a [ServiceConfigInputValidation] with the errors found as a result
  factory ServiceConfigInputValidation.fromValue(ServiceConfigInput value) =>
      spec.validate(value);

  static const spec = ValidaSpec(
    globalValidate: null,
    validationFactory: ServiceConfigInputValidation.new,
    getField: _getField,
    fieldsMap: {
      ServiceConfigInputField.gitRepo: ValidaString(
          matches:
              r'^https://github.com/([a-zA-Z0-9\-\_]+)/([a-zA-Z0-9\-\_]+)$',
          isUrl: true),
      ServiceConfigInputField.gitBranch:
          ValidaString(matches: GIT_BRANCH_REGEXP),
      ServiceConfigInputField.serverFile: ValidaString(
          matches: r'^[a-zA-Z0-9\_\.]([a-zA-Z0-9\-\_/\.]+)[a-zA-Z0-9]$'),
      ServiceConfigInputField.commands: ValidaList(
          description: 'The command names should be unique',
          customValidate: ServiceConfigInput.validateCommands,
          each: ValidaNested(
              overrideValidation: CliCommandInputValidation.fromValue)),
    },
  );

  static List<ValidaError> _globalValidate(ServiceConfigInput value) => [];

  static Object? _getField(ServiceConfigInput value, String field) {
    switch (field) {
      case 'gitRepo':
        return value.gitRepo;
      case 'gitBranch':
        return value.gitBranch;
      case 'serverFile':
        return value.serverFile;
      case 'commands':
        return value.commands;
      case 'id':
        return value.id;
      case 'hashCode':
        return value.hashCode;
      case 'runtimeType':
        return value.runtimeType;
      default:
        throw Exception('Could not find field "$field" for value $value.');
    }
  }
}

enum CliCommandInputField {
  command,
  variables,
}

class CliCommandInputValidationFields {
  const CliCommandInputValidationFields(this.errorsMap);
  final Map<CliCommandInputField, List<ValidaError>> errorsMap;

  List<ValidaError> get command =>
      errorsMap[CliCommandInputField.command] ?? const [];
  List<ValidaError> get variables =>
      errorsMap[CliCommandInputField.variables] ?? const [];
}

class CliCommandInputValidation
    extends Validation<CliCommandInput, CliCommandInputField> {
  CliCommandInputValidation(this.errorsMap, this.value)
      : fields = CliCommandInputValidationFields(errorsMap),
        super(errorsMap);
  @override
  final Map<CliCommandInputField, List<ValidaError>> errorsMap;
  @override
  final CliCommandInput value;
  @override
  final CliCommandInputValidationFields fields;

  /// Validates [value] and returns a [CliCommandInputValidation] with the errors found as a result
  factory CliCommandInputValidation.fromValue(CliCommandInput value) =>
      spec.validate(value);

  static const spec = ValidaSpec(
    globalValidate: null,
    validationFactory: CliCommandInputValidation.new,
    getField: _getField,
    fieldsMap: {
      CliCommandInputField.command:
          ValidaString(matches: r'^([^\s]+.*[^\s]+|[^\s]{1})$'),
      CliCommandInputField.variables:
          ValidaList(customValidate: CliCommandInput.validateVariables),
    },
  );

  static List<ValidaError> _globalValidate(CliCommandInput value) => [];

  static Object? _getField(CliCommandInput value, String field) {
    switch (field) {
      case 'name':
        return value.name;
      case 'command':
        return value.command;
      case 'variables':
        return value.variables;
      case 'hashCode':
        return value.hashCode;
      case 'runtimeType':
        return value.runtimeType;
      default:
        throw Exception('Could not find field "$field" for value $value.');
    }
  }
}

enum CompilationFilterField {
  gitRepo,
  gitBranch,
  serverFile,
  commitHash,
  startTime,
  endTime,
}

class CompilationFilterValidationFields {
  const CompilationFilterValidationFields(this.errorsMap);
  final Map<CompilationFilterField, List<ValidaError>> errorsMap;

  StringFilterValidation? get gitRepo {
    final l = errorsMap[CompilationFilterField.gitRepo];
    return (l != null && l.isNotEmpty)
        ? l.first.nestedValidation as StringFilterValidation?
        : null;
  }

  StringFilterValidation? get gitBranch {
    final l = errorsMap[CompilationFilterField.gitBranch];
    return (l != null && l.isNotEmpty)
        ? l.first.nestedValidation as StringFilterValidation?
        : null;
  }

  StringFilterValidation? get serverFile {
    final l = errorsMap[CompilationFilterField.serverFile];
    return (l != null && l.isNotEmpty)
        ? l.first.nestedValidation as StringFilterValidation?
        : null;
  }

  StringFilterValidation? get commitHash {
    final l = errorsMap[CompilationFilterField.commitHash];
    return (l != null && l.isNotEmpty)
        ? l.first.nestedValidation as StringFilterValidation?
        : null;
  }

  DateTimeFilterValidation? get startTime {
    final l = errorsMap[CompilationFilterField.startTime];
    return (l != null && l.isNotEmpty)
        ? l.first.nestedValidation as DateTimeFilterValidation?
        : null;
  }

  DateTimeFilterValidation? get endTime {
    final l = errorsMap[CompilationFilterField.endTime];
    return (l != null && l.isNotEmpty)
        ? l.first.nestedValidation as DateTimeFilterValidation?
        : null;
  }
}

class CompilationFilterValidation
    extends Validation<CompilationFilter, CompilationFilterField> {
  CompilationFilterValidation(this.errorsMap, this.value)
      : fields = CompilationFilterValidationFields(errorsMap),
        super(errorsMap);
  @override
  final Map<CompilationFilterField, List<ValidaError>> errorsMap;
  @override
  final CompilationFilter value;
  @override
  final CompilationFilterValidationFields fields;

  /// Validates [value] and returns a [CompilationFilterValidation] with the errors found as a result
  factory CompilationFilterValidation.fromValue(CompilationFilter value) =>
      spec.validate(value);

  static const spec = ValidaSpec(
    globalValidate: null,
    validationFactory: CompilationFilterValidation.new,
    getField: _getField,
    fieldsMap: {
      CompilationFilterField.gitRepo: ValidaNested<StringFilter>(
        omit: null,
        customValidate: null,
        overrideValidation: StringFilterValidation.fromValue,
      ),
      CompilationFilterField.gitBranch: ValidaNested<StringFilter>(
        omit: null,
        customValidate: null,
        overrideValidation: StringFilterValidation.fromValue,
      ),
      CompilationFilterField.serverFile: ValidaNested<StringFilter>(
        omit: null,
        customValidate: null,
        overrideValidation: StringFilterValidation.fromValue,
      ),
      CompilationFilterField.commitHash: ValidaNested<StringFilter>(
        omit: null,
        customValidate: null,
        overrideValidation: StringFilterValidation.fromValue,
      ),
      CompilationFilterField.startTime: ValidaNested<DateTimeFilter>(
        omit: null,
        customValidate: null,
        overrideValidation: DateTimeFilterValidation.fromValue,
      ),
      CompilationFilterField.endTime: ValidaNested<DateTimeFilter>(
        omit: null,
        customValidate: null,
        overrideValidation: DateTimeFilterValidation.fromValue,
      ),
    },
  );

  static List<ValidaError> _globalValidate(CompilationFilter value) => [];

  static Object? _getField(CompilationFilter value, String field) {
    switch (field) {
      case 'gitRepo':
        return value.gitRepo;
      case 'gitBranch':
        return value.gitBranch;
      case 'serverFile':
        return value.serverFile;
      case 'commitHash':
        return value.commitHash;
      case 'statusIsIn':
        return value.statusIsIn;
      case 'startTime':
        return value.startTime;
      case 'endTime':
        return value.endTime;
      case 'hashCode':
        return value.hashCode;
      case 'runtimeType':
        return value.runtimeType;
      default:
        throw Exception('Could not find field "$field" for value $value.');
    }
  }
}
