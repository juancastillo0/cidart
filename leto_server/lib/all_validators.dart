import 'package:valida/valida.dart';
import 'package:leto_server/src/compiler_api_models.dart';
import 'package:leto_server/src/filters.dart';
import 'package:leto_server/src/compiler_api.dart';
import 'package:leto_server/src/compiler_models.dart';

/// A validator with all the validators
/// found in code generation.
class Validators with GenericValidator {
  Validators._() {
    for (final v in <Validator>[
      validatorServiceConfigInput,
      validatorCliCommandInput,
      validatorCompilationFilter,
      validatorDateTimeFilter,
      validatorStringFilter,
      validatorValidateServiceConfigArgs,
      validatorCompilationsArgs,
      validatorCliCommandVariable,
    ]) {
      typeMap[v.modelType] = v;
      typeMap[v.modelNullType] = v;
    }
  }
  static final _instance = Validators._();

  /// Returns the [Validators] instance with the validators
  /// found in code generation
  static Validators instance() => _instance;

  /// A map with all registered validators by
  /// the type of the model to validate
  final typeMap = <Type, Validator>{};

  @override
  Validator<T, Validation<T, Object>>? validator<T>() {
    final validator = typeMap[T];
    return validator as Validator<T, Validation<T, Object>>?;
  }

  @override
  Validation<T, Object>? validate<T>(T value) {
    if (value == null) return null;
    final validator = typeMap[T];
    return validator?.validate(value) as Validation<T, Object>?;
  }

  static const validatorServiceConfigInput =
      Validator(ServiceConfigInputValidation.fromValue);
  static const validatorCliCommandInput =
      Validator(CliCommandInputValidation.fromValue);
  static const validatorCompilationFilter =
      Validator(CompilationFilterValidation.fromValue);
  static const validatorDateTimeFilter =
      Validator(DateTimeFilterValidation.fromValue);
  static const validatorStringFilter =
      Validator(StringFilterValidation.fromValue);
  static const validatorValidateServiceConfigArgs =
      Validator(ValidateServiceConfigArgsValidation.fromValue);
  static const validatorCompilationsArgs =
      Validator(CompilationsArgsValidation.fromValue);
  static const validatorCliCommandVariable =
      Validator(CliCommandVariableValidation.fromValue);
}
