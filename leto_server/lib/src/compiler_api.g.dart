// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compiler_api.dart';

// **************************************************************************
// _GraphQLGenerator
// **************************************************************************

GraphQLObjectField<List<CompilationLog>, Object?, Object?>
    get startServiceGraphQLField => _startServiceGraphQLField.value;
final _startServiceGraphQLField = HotReloadableDefinition<
        GraphQLObjectField<List<CompilationLog>, Object?, Object?>>(
    (setValue) => setValue(
            compilationLogGraphQLType.nonNull().list().nonNull().field<Object?>(
          'startService',
          resolve: (obj, ctx) {
            final args = ctx.args;

            return startService(ctx);
          },
        )));

GraphQLObjectField<String?, Object?, Object?> get topOutputGraphQLField =>
    _topOutputGraphQLField.value;
final _topOutputGraphQLField =
    HotReloadableDefinition<GraphQLObjectField<String?, Object?, Object?>>(
        (setValue) => setValue(graphQLString.field<Object?>(
              'topOutput',
              resolve: (obj, ctx) {
                final args = ctx.args;

                return topOutput(ctx);
              },
            )));

GraphQLObjectField<List<ServiceConfig>, Object?, Object?>
    get servicesGraphQLField => _servicesGraphQLField.value;
final _servicesGraphQLField = HotReloadableDefinition<
        GraphQLObjectField<List<ServiceConfig>, Object?, Object?>>(
    (setValue) => setValue(
            serviceConfigGraphQLType.nonNull().list().nonNull().field<Object?>(
          'services',
          resolve: (obj, ctx) {
            final args = ctx.args;

            return services(ctx);
          },
        )));

GraphQLObjectField<ServiceConfig, Object?, Object?>
    get createServiceGraphQLField => _createServiceGraphQLField.value;
final _createServiceGraphQLField = HotReloadableDefinition<
    GraphQLObjectField<ServiceConfig, Object?, Object?>>((setValue) => setValue(
        serviceConfigGraphQLType.nonNull().field<Object?>(
      'createService',
      resolve: (obj, ctx) {
        final args = ctx.args;
        final validationErrorMap = <String, List<ValidaError>>{};

        if ((args["config"] as ServiceConfigInput) != null) {
          final configValidationResult = ServiceConfigInputValidation.fromValue(
              (args["config"] as ServiceConfigInput) as ServiceConfigInput);
          if (configValidationResult.hasErrors) {
            validationErrorMap['config'] = [
              configValidationResult.toError(property: 'config')!
            ];
          }
        }

        if (validationErrorMap.isNotEmpty) {
          throw GraphQLError(
            'Input validation error',
            extensions: {
              'validaErrors': validationErrorMap,
            },
            sourceError: validationErrorMap,
          );
        }

        return createService(ctx, (args["config"] as ServiceConfigInput));
      },
    ))
      ..inputs.addAll(
          [serviceConfigInputGraphQLTypeInput.nonNull().inputField('config')]));

GraphQLObjectField<ServiceConfig?, Object?, Object?>
    get deleteServiceGraphQLField => _deleteServiceGraphQLField.value;
final _deleteServiceGraphQLField = HotReloadableDefinition<
        GraphQLObjectField<ServiceConfig?, Object?, Object?>>(
    (setValue) => setValue(serviceConfigGraphQLType.field<Object?>(
          'deleteService',
          resolve: (obj, ctx) {
            final args = ctx.args;

            return deleteService(ctx, (args["serviceId"] as String));
          },
        ))
          ..inputs.addAll([graphQLString.nonNull().inputField('serviceId')]));

GraphQLObjectField<CompilationEvent, Object?, Object?>
    get serviceUpdatesGraphQLField => _serviceUpdatesGraphQLField.value;
final _serviceUpdatesGraphQLField = HotReloadableDefinition<
        GraphQLObjectField<CompilationEvent, Object?, Object?>>(
    (setValue) => setValue(compilationEventGraphQLType.nonNull().field<Object?>(
          'serviceUpdates',
          subscribe: (obj, ctx) {
            final args = ctx.args;

            return serviceUpdates(ctx, (args["serviceId"] as String));
          },
        ))
          ..inputs.addAll([graphQLString.nonNull().inputField('serviceId')]));

GraphQLObjectField<CompilationEvent, Object?, Object?>
    get createServiceAndReceiveUpdatesGraphQLField =>
        _createServiceAndReceiveUpdatesGraphQLField.value;
final _createServiceAndReceiveUpdatesGraphQLField = HotReloadableDefinition<
    GraphQLObjectField<CompilationEvent, Object?,
        Object?>>((setValue) =>
    setValue(compilationEventGraphQLType.nonNull().field<Object?>(
      'createServiceAndReceiveUpdates',
      subscribe: (obj, ctx) {
        final args = ctx.args;
        final validationErrorMap = <String, List<ValidaError>>{};

        if ((args["config"] as ServiceConfigInput) != null) {
          final configValidationResult = ServiceConfigInputValidation.fromValue(
              (args["config"] as ServiceConfigInput) as ServiceConfigInput);
          if (configValidationResult.hasErrors) {
            validationErrorMap['config'] = [
              configValidationResult.toError(property: 'config')!
            ];
          }
        }

        if (validationErrorMap.isNotEmpty) {
          throw GraphQLError(
            'Input validation error',
            extensions: {
              'validaErrors': validationErrorMap,
            },
            sourceError: validationErrorMap,
          );
        }

        return createServiceAndReceiveUpdates(
            ctx, (args["config"] as ServiceConfigInput));
      },
    ))
      ..inputs.addAll(
          [serviceConfigInputGraphQLTypeInput.nonNull().inputField('config')]));

GraphQLObjectField<List<Compilation>, Object?, Object?>
    get compilationsGraphQLField => _compilationsGraphQLField.value;
final _compilationsGraphQLField = HotReloadableDefinition<
    GraphQLObjectField<List<Compilation>, Object?,
        Object?>>((setValue) =>
    setValue(compilationGraphQLType.nonNull().list().nonNull().field<Object?>(
      'compilations',
      resolve: (obj, ctx) {
        final args = ctx.args;
        final validationErrorMap = <String, List<ValidaError>>{};

        final _validation =
            CompilationsArgs(ctx, (args["anyOf"] as List<CompilationFilter>?))
                .validate();
        validationErrorMap.addAll(_validation.errorsMap
            .map((k, v) => MapEntry(k is Enum ? k.name : k.toString(), v))
          ..removeWhere((k, v) => v.isEmpty));
        if (validationErrorMap.isNotEmpty) {
          throw GraphQLError(
            'Input validation error',
            extensions: {
              'validaErrors': validationErrorMap,
            },
            sourceError: validationErrorMap,
          );
        }

        return compilations(ctx, (args["anyOf"] as List<CompilationFilter>?));
      },
    ))
      ..inputs.addAll([
        compilationFilterGraphQLTypeInput.nonNull().list().inputField('anyOf')
      ]));

// **************************************************************************
// ValidatorGenerator
// **************************************************************************

/// The arguments for [compilations].
class CompilationsArgs with ToJson {
  final Ctx<dynamic> ctx;
  final List<CompilationFilter>? anyOf;

  /// The arguments for [compilations].
  const CompilationsArgs(
    this.ctx,
    this.anyOf,
  );

  /// Validates this arguments for [compilations].
  CompilationsArgsValidation validate() =>
      CompilationsArgsValidation.fromValue(this);

  /// Validates this arguments for [compilations] and
  /// returns the successfully [Validated] value or
  /// throws a [CompilationsArgsValidation] when there is an error.
  Validated<CompilationsArgs> validatedOrThrow() {
    final validation = validate();
    final validated = validation.validated;
    if (validated == null) {
      throw validation;
    }
    return validated;
  }

  @override
  Map<String, Object?> toJson() => {
        'ctx': ctx,
        'anyOf': anyOf,
      };

  @override
  String toString() => 'CompilationsArgs${toJson()}';

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CompilationsArgs &&
            ctx == other.ctx &&
            anyOf == other.anyOf);
  }

  @override
  int get hashCode => Object.hash(
        runtimeType,
        ctx,
        anyOf,
      );
}

enum CompilationsArgsField {
  anyOf,
}

class CompilationsArgsValidationFields {
  const CompilationsArgsValidationFields(this.errorsMap);
  final Map<CompilationsArgsField, List<ValidaError>> errorsMap;

  List<ValidaError> get anyOf =>
      errorsMap[CompilationsArgsField.anyOf] ?? const [];
}

class CompilationsArgsValidation
    extends Validation<CompilationsArgs, CompilationsArgsField> {
  CompilationsArgsValidation(this.errorsMap, this.value)
      : fields = CompilationsArgsValidationFields(errorsMap),
        super(errorsMap);
  @override
  final Map<CompilationsArgsField, List<ValidaError>> errorsMap;
  @override
  final CompilationsArgs value;
  @override
  final CompilationsArgsValidationFields fields;

  /// Validates [value] and returns a [CompilationsArgsValidation] with the errors found as a result
  factory CompilationsArgsValidation.fromValue(CompilationsArgs value) =>
      spec.validate(value);

  static const spec = ValidaSpec(
    globalValidate: null,
    validationFactory: CompilationsArgsValidation.new,
    getField: _getField,
    fieldsMap: {
      CompilationsArgsField.anyOf: ValidaList<CompilationFilter>(
          each: ValidaNested(
              overrideValidation: CompilationFilterValidation.fromValue)),
    },
  );

  static List<ValidaError> _globalValidate(CompilationsArgs value) => [];

  static Object? _getField(CompilationsArgs value, String field) {
    switch (field) {
      case 'ctx':
        return value.ctx;
      case 'anyOf':
        return value.anyOf;
      default:
        throw Exception('Could not find field "$field" for value $value.');
    }
  }
}
