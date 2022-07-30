import 'package:valida/valida.dart';
import 'package:leto_server/src/filters.dart';
import 'package:leto_server/src/compiler_api_models.dart';

// ignore: avoid_classes_with_only_static_members
class Validators {
  static const typeMap = <Type, Validator>{
    DateTimeFilter: validatorDateTimeFilter,
    StringFilter: validatorStringFilter,
    ServiceConfigInput: validatorServiceConfigInput,
    CliCommandInput: validatorCliCommandInput,
    CompilationFilter: validatorCompilationFilter,
  };

  static const validatorDateTimeFilter =
      Validator(DateTimeFilterValidation.fromValue);
  static const validatorStringFilter =
      Validator(StringFilterValidation.fromValue);
  static const validatorServiceConfigInput =
      Validator(ServiceConfigInputValidation.fromValue);
  static const validatorCliCommandInput =
      Validator(CliCommandInputValidation.fromValue);
  static const validatorCompilationFilter =
      Validator(CompilationFilterValidation.fromValue);

  static Validator<T, Validation<T, Object>>? validator<T>() {
    final validator = typeMap[T];
    return validator as Validator<T, Validation<T, Object>>?;
  }

  static Validation<T, Object>? validate<T>(T value) {
    final validator = typeMap[T];
    return validator?.validate(value) as Validation<T, Object>?;
  }
}
