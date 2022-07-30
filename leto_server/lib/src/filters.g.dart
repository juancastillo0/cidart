// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filters.dart';

// **************************************************************************
// _GraphQLGenerator
// **************************************************************************

final dateTimeFilterSerializer = SerializerValue<DateTimeFilter>(
  key: "DateTimeFilter",
  fromJson: (ctx, json) => DateTimeFilter.fromJson(json), // _$$FromJson,
  // toJson: (m) => _$$ToJson(m as _$),
);
final _dateTimeFilterGraphQLTypeInput =
    HotReloadableDefinition<GraphQLInputObjectType<DateTimeFilter>>((setValue) {
  final __name = 'DateTimeFilter';

  final __dateTimeFilterGraphQLTypeInput =
      inputObjectType<DateTimeFilter>(__name);

  setValue(__dateTimeFilterGraphQLTypeInput);
  __dateTimeFilterGraphQLTypeInput.fields.addAll(
    [
      graphQLDate.inputField('before'),
      graphQLDate.inputField('after', attachments: [
        ValidaAttachment(ValidaDate(
            comp: ValidaComparison(
                moreEq: CompVal.ref('before', isRequired: false)))),
      ])
    ],
  );

  return __dateTimeFilterGraphQLTypeInput;
});

/// Auto-generated from [DateTimeFilter].
GraphQLInputObjectType<DateTimeFilter> get dateTimeFilterGraphQLTypeInput =>
    _dateTimeFilterGraphQLTypeInput.value;

final compFilterSerdeCtx = SerdeCtx();
final _compFilterGraphQLTypeInput =
    HotReloadableDefinition<Map<String, GraphQLInputObjectType<CompFilter>>>(
        (_) => {});

/// Auto-generated from [CompFilter].
GraphQLInputObjectType<CompFilter<T>>
    compFilterGraphQLTypeInput<T extends Comparable<T>>(
  GraphQLType<T, Object> tGraphQLType, {
  String? name,
}) {
  final __name = name ?? 'CompFilter${tGraphQLType.printableName}';
  if (_compFilterGraphQLTypeInput.value[__name] != null)
    return _compFilterGraphQLTypeInput.value[__name]!
        as GraphQLInputObjectType<CompFilter<T>>;
  final __compFilterGraphQLTypeInput = inputObjectType<CompFilter<T>>(__name);
  compFilterSerdeCtx.add(
    SerializerValue<CompFilter<T>>(
      fromJson: (ctx, json) => CompFilter.fromJson(json, ctx.fromJson),
    ),
  );
  _compFilterGraphQLTypeInput.value[__name] = __compFilterGraphQLTypeInput;
  __compFilterGraphQLTypeInput.fields.addAll(
    [
      tGraphQLType.nonNull().list().inputField('isIn'),
      tGraphQLType.nonNull().list().inputField('isNotIn'),
      tGraphQLType.nullable().inputField('more'),
      tGraphQLType.nullable().inputField('less'),
      tGraphQLType.nullable().inputField('moreEq'),
      tGraphQLType.nullable().inputField('lessEq')
    ],
  );

  return __compFilterGraphQLTypeInput;
}

final stringFilterSerializer = SerializerValue<StringFilter>(
  key: "StringFilter",
  fromJson: (ctx, json) => StringFilter.fromJson(json), // _$$FromJson,
  // toJson: (m) => _$$ToJson(m as _$),
);
final _stringFilterGraphQLTypeInput =
    HotReloadableDefinition<GraphQLInputObjectType<StringFilter>>((setValue) {
  final __name = 'StringFilter';

  final __stringFilterGraphQLTypeInput = inputObjectType<StringFilter>(__name);

  setValue(__stringFilterGraphQLTypeInput);
  __stringFilterGraphQLTypeInput.fields.addAll(
    [
      graphQLString.inputField('contains'),
      graphQLString.inputField('regExp'),
      graphQLString.nonNull().list().inputField('isIn', attachments: [
        ValidaAttachment(ValidaList(minLength: 1)),
      ])
    ],
  );

  return __stringFilterGraphQLTypeInput;
});

/// Auto-generated from [StringFilter].
GraphQLInputObjectType<StringFilter> get stringFilterGraphQLTypeInput =>
    _stringFilterGraphQLTypeInput.value;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DateTimeFilter _$DateTimeFilterFromJson(Map<String, dynamic> json) =>
    DateTimeFilter(
      before: json['before'] == null
          ? null
          : DateTime.parse(json['before'] as String),
      after: json['after'] == null
          ? null
          : DateTime.parse(json['after'] as String),
    );

Map<String, dynamic> _$DateTimeFilterToJson(DateTimeFilter instance) =>
    <String, dynamic>{
      'before': instance.before?.toIso8601String(),
      'after': instance.after?.toIso8601String(),
    };

CompFilter<T> _$CompFilterFromJson<T extends Comparable<T>>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    CompFilter<T>(
      isIn: (json['isIn'] as List<dynamic>?)?.map(fromJsonT).toList(),
      isNotIn: (json['isNotIn'] as List<dynamic>?)?.map(fromJsonT).toList(),
      more: _$nullableGenericFromJson(json['more'], fromJsonT),
      less: _$nullableGenericFromJson(json['less'], fromJsonT),
      moreEq: _$nullableGenericFromJson(json['moreEq'], fromJsonT),
      lessEq: _$nullableGenericFromJson(json['lessEq'], fromJsonT),
    );

Map<String, dynamic> _$CompFilterToJson<T extends Comparable<T>>(
  CompFilter<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'isIn': instance.isIn?.map(toJsonT).toList(),
      'isNotIn': instance.isNotIn?.map(toJsonT).toList(),
      'more': _$nullableGenericToJson(instance.more, toJsonT),
      'less': _$nullableGenericToJson(instance.less, toJsonT),
      'moreEq': _$nullableGenericToJson(instance.moreEq, toJsonT),
      'lessEq': _$nullableGenericToJson(instance.lessEq, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);

StringFilter _$StringFilterFromJson(Map<String, dynamic> json) => StringFilter(
      contains: json['contains'] as String?,
      regExp: json['regExp'] as String?,
      isIn: (json['isIn'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$StringFilterToJson(StringFilter instance) =>
    <String, dynamic>{
      'contains': instance.contains,
      'regExp': instance.regExp,
      'isIn': instance.isIn,
    };

// **************************************************************************
// ValidatorGenerator
// **************************************************************************

enum DateTimeFilterField {
  after,
}

class DateTimeFilterValidationFields {
  const DateTimeFilterValidationFields(this.errorsMap);
  final Map<DateTimeFilterField, List<ValidaError>> errorsMap;

  List<ValidaError> get after =>
      errorsMap[DateTimeFilterField.after] ?? const [];
}

class DateTimeFilterValidation
    extends Validation<DateTimeFilter, DateTimeFilterField> {
  DateTimeFilterValidation(this.errorsMap, this.value, this.fields)
      : super(errorsMap);
  @override
  final Map<DateTimeFilterField, List<ValidaError>> errorsMap;
  @override
  final DateTimeFilter value;
  @override
  final DateTimeFilterValidationFields fields;

  /// Validates [value] and returns a [DateTimeFilterValidation] with the errors found as a result
  static DateTimeFilterValidation fromValue(DateTimeFilter value) {
    Object? _getProperty(String property) => spec.getField(value, property);

    final errors = <DateTimeFilterField, List<ValidaError>>{
      ...spec.fieldsMap.map(
        (key, field) => MapEntry(
          key,
          field.validate(key.name, _getProperty),
        ),
      )
    };
    errors.removeWhere((key, value) => value.isEmpty);
    return DateTimeFilterValidation(
        errors, value, DateTimeFilterValidationFields(errors));
  }

  static const spec = ValidaSpec(
    fieldsMap: {
      DateTimeFilterField.after: ValidaDate(
          comp: ValidaComparison(
              moreEq: CompVal.ref('before', isRequired: false))),
    },
    getField: _getField,
  );

  static List<ValidaError> _globalValidate(DateTimeFilter value) => [];

  static Object? _getField(DateTimeFilter value, String field) {
    switch (field) {
      case 'before':
        return value.before;
      case 'after':
        return value.after;
      case 'hashCode':
        return value.hashCode;
      case 'runtimeType':
        return value.runtimeType;
      default:
        throw Exception('Could not find field "$field" for value $value.');
    }
  }
}

enum StringFilterField {
  isIn,
}

class StringFilterValidationFields {
  const StringFilterValidationFields(this.errorsMap);
  final Map<StringFilterField, List<ValidaError>> errorsMap;

  List<ValidaError> get isIn => errorsMap[StringFilterField.isIn] ?? const [];
}

class StringFilterValidation
    extends Validation<StringFilter, StringFilterField> {
  StringFilterValidation(this.errorsMap, this.value, this.fields)
      : super(errorsMap);
  @override
  final Map<StringFilterField, List<ValidaError>> errorsMap;
  @override
  final StringFilter value;
  @override
  final StringFilterValidationFields fields;

  /// Validates [value] and returns a [StringFilterValidation] with the errors found as a result
  static StringFilterValidation fromValue(StringFilter value) {
    Object? _getProperty(String property) => spec.getField(value, property);

    final errors = <StringFilterField, List<ValidaError>>{
      ...spec.fieldsMap.map(
        (key, field) => MapEntry(
          key,
          field.validate(key.name, _getProperty),
        ),
      )
    };
    errors.removeWhere((key, value) => value.isEmpty);
    return StringFilterValidation(
        errors, value, StringFilterValidationFields(errors));
  }

  static const spec = ValidaSpec(
    fieldsMap: {
      StringFilterField.isIn: ValidaList(minLength: 1),
    },
    getField: _getField,
  );

  static List<ValidaError> _globalValidate(StringFilter value) => [];

  static Object? _getField(StringFilter value, String field) {
    switch (field) {
      case 'contains':
        return value.contains;
      case 'regExp':
        return value.regExp;
      case 'isIn':
        return value.isIn;
      case 'hashCode':
        return value.hashCode;
      case 'runtimeType':
        return value.runtimeType;
      default:
        throw Exception('Could not find field "$field" for value $value.');
    }
  }
}
