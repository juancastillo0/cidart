import 'package:json_annotation/json_annotation.dart';
import 'package:leto_schema/leto_schema.dart';
import 'package:valida/valida.dart';

part 'filters.g.dart';

@Valida()
@JsonSerializable()
@GraphQLInput()
class DateTimeFilter with Matcher<DateTime> {
  final DateTime? before;
  @ValidaDate(
    comp: ValidaComparison(moreEq: CompVal.ref('before', isRequired: false)),
  )
  final DateTime? after;

  DateTimeFilter({
    this.before,
    this.after,
  });

  factory DateTimeFilter.fromJson(Map<String, Object?> json) =>
      _$DateTimeFilterFromJson(json);
  Map<String, Object?> toJson() => _$DateTimeFilterToJson(this);

  bool isInTheFuture() {
    return before == null && (after == null || after!.isBefore(DateTime.now()));
  }

  @override
  bool hasMatch(DateTime value) {
    if (before != null && before!.isAfter(value)) {
      return false;
    } else if (after != null && after!.isBefore(value)) {
      return false;
    }
    return true;
  }
}

@JsonSerializable(genericArgumentFactories: true)
@GraphQLInput()
class CompFilter<T extends Comparable<T>> with Matcher<T> {
  // TODO: support generic in validation @ValidaList(minLength: 1)
  final List<T>? isIn;
  final List<T>? isNotIn;
  final T? more;
  final T? less;
  final T? moreEq;
  final T? lessEq;

  const CompFilter({
    this.isIn,
    this.isNotIn,
    this.more,
    this.less,
    this.moreEq,
    this.lessEq,
  });

  factory CompFilter.fromJson(
    Map<String, Object?> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$CompFilterFromJson(json, fromJsonT);

  Map<String, Object?> toJson(Object? Function(T) toJsonT) =>
      _$CompFilterToJson(this, toJsonT);

  @override
  bool hasMatch(T value) {
    if (isIn != null && isIn!.every((e) => e.compareTo(value) != 0)) {
      return false;
    } else if (isNotIn != null &&
        isNotIn!.any((e) => e.compareTo(value) == 0)) {
      return false;
    }

    final valida = ValidaComparison<T>(
      more: more == null ? null : CompVal(more!),
      less: less == null ? null : CompVal(less!),
      moreEq: moreEq == null ? null : CompVal(moreEq!),
      lessEq: lessEq == null ? null : CompVal(lessEq!),
    );
    return valida
        .validate(
          'value',
          (p0) => ComparisonResult.fromInt(p0.compareTo(value)),
          (_) => value,
        )
        .isEmpty;
  }
}

extension DateTimeFilterExt on CompFilter<DateTime> {
  /// [DateTime]s can represent time values that are at a distance of at most 100,000,000
  /// days from epoch (1970-01-01 UTC): -271821-04-20 to 275760-09-13.
  static DateTime minDateTime = DateTime.utc(-271821, 04, 20);
  static DateTime maxDateTime = DateTime.utc(275760, 09, 13);

  bool isInThePast() {
    return hasMatch(DateTime.now()) && hasMatch(minDateTime);
  }

  bool isInTheFuture() {
    return hasMatch(DateTime.now()) && hasMatch(maxDateTime);
  }
}

// @GraphQLInput()
// class ValidaComparisonInput<T extends Comparable<T>>
//     extends ValidaComparison<T> {

//   ValidaComparisonInput({
//     super.more,
//     super.less,
//     super.moreEq,
//     super.lessEq,
//     super.useCompareTo,
//   });

//   factory ValidaComparisonInput.fromInner(ValidaComparison<T> comp) =>
//       ValidaComparisonInput(
//         more: comp.more,
//         less: comp.less,
//         moreEq: comp.moreEq,
//         lessEq: comp.lessEq,
//         useCompareTo: comp.useCompareTo,
//       );

//   factory ValidaComparisonInput.fromJson(Map<String, Object?> json, _) {
//     final value = ValidaComparison<T>.fromJson(json);
//     return ValidaComparisonInput.fromInner(value);
//   }

//   @override
//   Map<String, Object?> toJson() => super.toJson();
// }

@Valida()
@JsonSerializable()
@GraphQLInput()
class StringFilter with Matcher<String> {
  final String? contains;
  final String? regExp;
  @ValidaList(minLength: 1)
  final List<String>? isIn;

  StringFilter({
    this.contains,
    this.regExp,
    this.isIn,
  });

  factory StringFilter.fromJson(Map<String, Object?> json) =>
      _$StringFilterFromJson(json);
  Map<String, Object?> toJson() => _$StringFilterToJson(this);

  @override
  bool hasMatch(String value) {
    if (contains != null && !value.contains(contains!)) {
      return false;
    } else if (regExp != null && !RegExp(regExp!).hasMatch(value)) {
      return false;
    } else if (isIn != null && !isIn!.contains(value)) {
      return false;
    }
    return true;
  }
}

mixin Matcher<T> {
  bool hasMatch(T value);
}

// eq, neq
// gt, lt, gte, lte
// in, nin
// contains, regExp, like
// isNull
