class Input$CompilationFilter {
  factory Input$CompilationFilter(
          {Input$ServiceConfigFilter? serviceConfig,
          Input$StringFilter? commitHash,
          List<Enum$CompilationStatus>? statusIsIn,
          Input$DateTimeFilter? startTime,
          Input$DateTimeFilter? endTime}) =>
      Input$CompilationFilter._({
        if (serviceConfig != null) r'serviceConfig': serviceConfig,
        if (commitHash != null) r'commitHash': commitHash,
        if (statusIsIn != null) r'statusIsIn': statusIsIn,
        if (startTime != null) r'startTime': startTime,
        if (endTime != null) r'endTime': endTime,
      });

  Input$CompilationFilter._(this._$data);

  factory Input$CompilationFilter.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('serviceConfig')) {
      final l$serviceConfig = data['serviceConfig'];
      result$data['serviceConfig'] = l$serviceConfig == null
          ? null
          : Input$ServiceConfigFilter.fromJson(
              (l$serviceConfig as Map<String, dynamic>));
    }
    if (data.containsKey('commitHash')) {
      final l$commitHash = data['commitHash'];
      result$data['commitHash'] = l$commitHash == null
          ? null
          : Input$StringFilter.fromJson((l$commitHash as Map<String, dynamic>));
    }
    if (data.containsKey('statusIsIn')) {
      final l$statusIsIn = data['statusIsIn'];
      result$data['statusIsIn'] = (l$statusIsIn as List<dynamic>?)
          ?.map((e) => fromJson$Enum$CompilationStatus((e as String)))
          .toList();
    }
    if (data.containsKey('startTime')) {
      final l$startTime = data['startTime'];
      result$data['startTime'] = l$startTime == null
          ? null
          : Input$DateTimeFilter.fromJson(
              (l$startTime as Map<String, dynamic>));
    }
    if (data.containsKey('endTime')) {
      final l$endTime = data['endTime'];
      result$data['endTime'] = l$endTime == null
          ? null
          : Input$DateTimeFilter.fromJson((l$endTime as Map<String, dynamic>));
    }
    return Input$CompilationFilter._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$ServiceConfigFilter? get serviceConfig =>
      (_$data['serviceConfig'] as Input$ServiceConfigFilter?);
  Input$StringFilter? get commitHash =>
      (_$data['commitHash'] as Input$StringFilter?);
  List<Enum$CompilationStatus>? get statusIsIn =>
      (_$data['statusIsIn'] as List<Enum$CompilationStatus>?);
  Input$DateTimeFilter? get startTime =>
      (_$data['startTime'] as Input$DateTimeFilter?);
  Input$DateTimeFilter? get endTime =>
      (_$data['endTime'] as Input$DateTimeFilter?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('serviceConfig')) {
      final l$serviceConfig = serviceConfig;
      result$data['serviceConfig'] = l$serviceConfig?.toJson();
    }
    if (_$data.containsKey('commitHash')) {
      final l$commitHash = commitHash;
      result$data['commitHash'] = l$commitHash?.toJson();
    }
    if (_$data.containsKey('statusIsIn')) {
      final l$statusIsIn = statusIsIn;
      result$data['statusIsIn'] =
          l$statusIsIn?.map((e) => toJson$Enum$CompilationStatus(e)).toList();
    }
    if (_$data.containsKey('startTime')) {
      final l$startTime = startTime;
      result$data['startTime'] = l$startTime?.toJson();
    }
    if (_$data.containsKey('endTime')) {
      final l$endTime = endTime;
      result$data['endTime'] = l$endTime?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$CompilationFilter<Input$CompilationFilter> get copyWith =>
      CopyWith$Input$CompilationFilter(this, (i) => i);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$CompilationFilter) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$serviceConfig = serviceConfig;
    final lOther$serviceConfig = other.serviceConfig;
    if (_$data.containsKey('serviceConfig') !=
        other._$data.containsKey('serviceConfig')) {
      return false;
    }
    if (l$serviceConfig != lOther$serviceConfig) {
      return false;
    }
    final l$commitHash = commitHash;
    final lOther$commitHash = other.commitHash;
    if (_$data.containsKey('commitHash') !=
        other._$data.containsKey('commitHash')) {
      return false;
    }
    if (l$commitHash != lOther$commitHash) {
      return false;
    }
    final l$statusIsIn = statusIsIn;
    final lOther$statusIsIn = other.statusIsIn;
    if (_$data.containsKey('statusIsIn') !=
        other._$data.containsKey('statusIsIn')) {
      return false;
    }
    if (l$statusIsIn != null && lOther$statusIsIn != null) {
      if (l$statusIsIn.length != lOther$statusIsIn.length) {
        return false;
      }
      for (int i = 0; i < l$statusIsIn.length; i++) {
        final l$statusIsIn$entry = l$statusIsIn[i];
        final lOther$statusIsIn$entry = lOther$statusIsIn[i];
        if (l$statusIsIn$entry != lOther$statusIsIn$entry) {
          return false;
        }
      }
    } else if (l$statusIsIn != lOther$statusIsIn) {
      return false;
    }
    final l$startTime = startTime;
    final lOther$startTime = other.startTime;
    if (_$data.containsKey('startTime') !=
        other._$data.containsKey('startTime')) {
      return false;
    }
    if (l$startTime != lOther$startTime) {
      return false;
    }
    final l$endTime = endTime;
    final lOther$endTime = other.endTime;
    if (_$data.containsKey('endTime') != other._$data.containsKey('endTime')) {
      return false;
    }
    if (l$endTime != lOther$endTime) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$serviceConfig = serviceConfig;
    final l$commitHash = commitHash;
    final l$statusIsIn = statusIsIn;
    final l$startTime = startTime;
    final l$endTime = endTime;
    return Object.hashAll([
      _$data.containsKey('serviceConfig') ? l$serviceConfig : const {},
      _$data.containsKey('commitHash') ? l$commitHash : const {},
      _$data.containsKey('statusIsIn')
          ? l$statusIsIn == null
              ? null
              : Object.hashAll(l$statusIsIn.map((v) => v))
          : const {},
      _$data.containsKey('startTime') ? l$startTime : const {},
      _$data.containsKey('endTime') ? l$endTime : const {}
    ]);
  }
}

abstract class CopyWith$Input$CompilationFilter<TRes> {
  factory CopyWith$Input$CompilationFilter(Input$CompilationFilter instance,
          TRes Function(Input$CompilationFilter) then) =
      _CopyWithImpl$Input$CompilationFilter;

  factory CopyWith$Input$CompilationFilter.stub(TRes res) =
      _CopyWithStubImpl$Input$CompilationFilter;

  TRes call(
      {Input$ServiceConfigFilter? serviceConfig,
      Input$StringFilter? commitHash,
      List<Enum$CompilationStatus>? statusIsIn,
      Input$DateTimeFilter? startTime,
      Input$DateTimeFilter? endTime});
  CopyWith$Input$ServiceConfigFilter<TRes> get serviceConfig;
  CopyWith$Input$StringFilter<TRes> get commitHash;
  CopyWith$Input$DateTimeFilter<TRes> get startTime;
  CopyWith$Input$DateTimeFilter<TRes> get endTime;
}

class _CopyWithImpl$Input$CompilationFilter<TRes>
    implements CopyWith$Input$CompilationFilter<TRes> {
  _CopyWithImpl$Input$CompilationFilter(this._instance, this._then);

  final Input$CompilationFilter _instance;

  final TRes Function(Input$CompilationFilter) _then;

  static const _undefined = {};

  TRes call(
          {Object? serviceConfig = _undefined,
          Object? commitHash = _undefined,
          Object? statusIsIn = _undefined,
          Object? startTime = _undefined,
          Object? endTime = _undefined}) =>
      _then(Input$CompilationFilter._({
        ..._instance._$data,
        if (serviceConfig != _undefined)
          'serviceConfig': (serviceConfig as Input$ServiceConfigFilter?),
        if (commitHash != _undefined)
          'commitHash': (commitHash as Input$StringFilter?),
        if (statusIsIn != _undefined)
          'statusIsIn': (statusIsIn as List<Enum$CompilationStatus>?),
        if (startTime != _undefined)
          'startTime': (startTime as Input$DateTimeFilter?),
        if (endTime != _undefined)
          'endTime': (endTime as Input$DateTimeFilter?),
      }));
  CopyWith$Input$ServiceConfigFilter<TRes> get serviceConfig {
    final local$serviceConfig = _instance.serviceConfig;
    return local$serviceConfig == null
        ? CopyWith$Input$ServiceConfigFilter.stub(_then(_instance))
        : CopyWith$Input$ServiceConfigFilter(
            local$serviceConfig, (e) => call(serviceConfig: e));
  }

  CopyWith$Input$StringFilter<TRes> get commitHash {
    final local$commitHash = _instance.commitHash;
    return local$commitHash == null
        ? CopyWith$Input$StringFilter.stub(_then(_instance))
        : CopyWith$Input$StringFilter(
            local$commitHash, (e) => call(commitHash: e));
  }

  CopyWith$Input$DateTimeFilter<TRes> get startTime {
    final local$startTime = _instance.startTime;
    return local$startTime == null
        ? CopyWith$Input$DateTimeFilter.stub(_then(_instance))
        : CopyWith$Input$DateTimeFilter(
            local$startTime, (e) => call(startTime: e));
  }

  CopyWith$Input$DateTimeFilter<TRes> get endTime {
    final local$endTime = _instance.endTime;
    return local$endTime == null
        ? CopyWith$Input$DateTimeFilter.stub(_then(_instance))
        : CopyWith$Input$DateTimeFilter(local$endTime, (e) => call(endTime: e));
  }
}

class _CopyWithStubImpl$Input$CompilationFilter<TRes>
    implements CopyWith$Input$CompilationFilter<TRes> {
  _CopyWithStubImpl$Input$CompilationFilter(this._res);

  TRes _res;

  call(
          {Input$ServiceConfigFilter? serviceConfig,
          Input$StringFilter? commitHash,
          List<Enum$CompilationStatus>? statusIsIn,
          Input$DateTimeFilter? startTime,
          Input$DateTimeFilter? endTime}) =>
      _res;
  CopyWith$Input$ServiceConfigFilter<TRes> get serviceConfig =>
      CopyWith$Input$ServiceConfigFilter.stub(_res);
  CopyWith$Input$StringFilter<TRes> get commitHash =>
      CopyWith$Input$StringFilter.stub(_res);
  CopyWith$Input$DateTimeFilter<TRes> get startTime =>
      CopyWith$Input$DateTimeFilter.stub(_res);
  CopyWith$Input$DateTimeFilter<TRes> get endTime =>
      CopyWith$Input$DateTimeFilter.stub(_res);
}

class Input$ServiceConfigFilter {
  factory Input$ServiceConfigFilter(
          {Input$StringFilter? serviceId,
          Input$StringFilter? gitRepo,
          Input$StringFilter? gitBranch,
          Input$StringFilter? serverFile,
          Input$DateTimeFilter? createdDate}) =>
      Input$ServiceConfigFilter._({
        if (serviceId != null) r'serviceId': serviceId,
        if (gitRepo != null) r'gitRepo': gitRepo,
        if (gitBranch != null) r'gitBranch': gitBranch,
        if (serverFile != null) r'serverFile': serverFile,
        if (createdDate != null) r'createdDate': createdDate,
      });

  Input$ServiceConfigFilter._(this._$data);

  factory Input$ServiceConfigFilter.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('serviceId')) {
      final l$serviceId = data['serviceId'];
      result$data['serviceId'] = l$serviceId == null
          ? null
          : Input$StringFilter.fromJson((l$serviceId as Map<String, dynamic>));
    }
    if (data.containsKey('gitRepo')) {
      final l$gitRepo = data['gitRepo'];
      result$data['gitRepo'] = l$gitRepo == null
          ? null
          : Input$StringFilter.fromJson((l$gitRepo as Map<String, dynamic>));
    }
    if (data.containsKey('gitBranch')) {
      final l$gitBranch = data['gitBranch'];
      result$data['gitBranch'] = l$gitBranch == null
          ? null
          : Input$StringFilter.fromJson((l$gitBranch as Map<String, dynamic>));
    }
    if (data.containsKey('serverFile')) {
      final l$serverFile = data['serverFile'];
      result$data['serverFile'] = l$serverFile == null
          ? null
          : Input$StringFilter.fromJson((l$serverFile as Map<String, dynamic>));
    }
    if (data.containsKey('createdDate')) {
      final l$createdDate = data['createdDate'];
      result$data['createdDate'] = l$createdDate == null
          ? null
          : Input$DateTimeFilter.fromJson(
              (l$createdDate as Map<String, dynamic>));
    }
    return Input$ServiceConfigFilter._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$StringFilter? get serviceId =>
      (_$data['serviceId'] as Input$StringFilter?);
  Input$StringFilter? get gitRepo => (_$data['gitRepo'] as Input$StringFilter?);
  Input$StringFilter? get gitBranch =>
      (_$data['gitBranch'] as Input$StringFilter?);
  Input$StringFilter? get serverFile =>
      (_$data['serverFile'] as Input$StringFilter?);
  Input$DateTimeFilter? get createdDate =>
      (_$data['createdDate'] as Input$DateTimeFilter?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('serviceId')) {
      final l$serviceId = serviceId;
      result$data['serviceId'] = l$serviceId?.toJson();
    }
    if (_$data.containsKey('gitRepo')) {
      final l$gitRepo = gitRepo;
      result$data['gitRepo'] = l$gitRepo?.toJson();
    }
    if (_$data.containsKey('gitBranch')) {
      final l$gitBranch = gitBranch;
      result$data['gitBranch'] = l$gitBranch?.toJson();
    }
    if (_$data.containsKey('serverFile')) {
      final l$serverFile = serverFile;
      result$data['serverFile'] = l$serverFile?.toJson();
    }
    if (_$data.containsKey('createdDate')) {
      final l$createdDate = createdDate;
      result$data['createdDate'] = l$createdDate?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$ServiceConfigFilter<Input$ServiceConfigFilter> get copyWith =>
      CopyWith$Input$ServiceConfigFilter(this, (i) => i);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$ServiceConfigFilter) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$serviceId = serviceId;
    final lOther$serviceId = other.serviceId;
    if (_$data.containsKey('serviceId') !=
        other._$data.containsKey('serviceId')) {
      return false;
    }
    if (l$serviceId != lOther$serviceId) {
      return false;
    }
    final l$gitRepo = gitRepo;
    final lOther$gitRepo = other.gitRepo;
    if (_$data.containsKey('gitRepo') != other._$data.containsKey('gitRepo')) {
      return false;
    }
    if (l$gitRepo != lOther$gitRepo) {
      return false;
    }
    final l$gitBranch = gitBranch;
    final lOther$gitBranch = other.gitBranch;
    if (_$data.containsKey('gitBranch') !=
        other._$data.containsKey('gitBranch')) {
      return false;
    }
    if (l$gitBranch != lOther$gitBranch) {
      return false;
    }
    final l$serverFile = serverFile;
    final lOther$serverFile = other.serverFile;
    if (_$data.containsKey('serverFile') !=
        other._$data.containsKey('serverFile')) {
      return false;
    }
    if (l$serverFile != lOther$serverFile) {
      return false;
    }
    final l$createdDate = createdDate;
    final lOther$createdDate = other.createdDate;
    if (_$data.containsKey('createdDate') !=
        other._$data.containsKey('createdDate')) {
      return false;
    }
    if (l$createdDate != lOther$createdDate) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$serviceId = serviceId;
    final l$gitRepo = gitRepo;
    final l$gitBranch = gitBranch;
    final l$serverFile = serverFile;
    final l$createdDate = createdDate;
    return Object.hashAll([
      _$data.containsKey('serviceId') ? l$serviceId : const {},
      _$data.containsKey('gitRepo') ? l$gitRepo : const {},
      _$data.containsKey('gitBranch') ? l$gitBranch : const {},
      _$data.containsKey('serverFile') ? l$serverFile : const {},
      _$data.containsKey('createdDate') ? l$createdDate : const {}
    ]);
  }
}

abstract class CopyWith$Input$ServiceConfigFilter<TRes> {
  factory CopyWith$Input$ServiceConfigFilter(Input$ServiceConfigFilter instance,
          TRes Function(Input$ServiceConfigFilter) then) =
      _CopyWithImpl$Input$ServiceConfigFilter;

  factory CopyWith$Input$ServiceConfigFilter.stub(TRes res) =
      _CopyWithStubImpl$Input$ServiceConfigFilter;

  TRes call(
      {Input$StringFilter? serviceId,
      Input$StringFilter? gitRepo,
      Input$StringFilter? gitBranch,
      Input$StringFilter? serverFile,
      Input$DateTimeFilter? createdDate});
  CopyWith$Input$StringFilter<TRes> get serviceId;
  CopyWith$Input$StringFilter<TRes> get gitRepo;
  CopyWith$Input$StringFilter<TRes> get gitBranch;
  CopyWith$Input$StringFilter<TRes> get serverFile;
  CopyWith$Input$DateTimeFilter<TRes> get createdDate;
}

class _CopyWithImpl$Input$ServiceConfigFilter<TRes>
    implements CopyWith$Input$ServiceConfigFilter<TRes> {
  _CopyWithImpl$Input$ServiceConfigFilter(this._instance, this._then);

  final Input$ServiceConfigFilter _instance;

  final TRes Function(Input$ServiceConfigFilter) _then;

  static const _undefined = {};

  TRes call(
          {Object? serviceId = _undefined,
          Object? gitRepo = _undefined,
          Object? gitBranch = _undefined,
          Object? serverFile = _undefined,
          Object? createdDate = _undefined}) =>
      _then(Input$ServiceConfigFilter._({
        ..._instance._$data,
        if (serviceId != _undefined)
          'serviceId': (serviceId as Input$StringFilter?),
        if (gitRepo != _undefined) 'gitRepo': (gitRepo as Input$StringFilter?),
        if (gitBranch != _undefined)
          'gitBranch': (gitBranch as Input$StringFilter?),
        if (serverFile != _undefined)
          'serverFile': (serverFile as Input$StringFilter?),
        if (createdDate != _undefined)
          'createdDate': (createdDate as Input$DateTimeFilter?),
      }));
  CopyWith$Input$StringFilter<TRes> get serviceId {
    final local$serviceId = _instance.serviceId;
    return local$serviceId == null
        ? CopyWith$Input$StringFilter.stub(_then(_instance))
        : CopyWith$Input$StringFilter(
            local$serviceId, (e) => call(serviceId: e));
  }

  CopyWith$Input$StringFilter<TRes> get gitRepo {
    final local$gitRepo = _instance.gitRepo;
    return local$gitRepo == null
        ? CopyWith$Input$StringFilter.stub(_then(_instance))
        : CopyWith$Input$StringFilter(local$gitRepo, (e) => call(gitRepo: e));
  }

  CopyWith$Input$StringFilter<TRes> get gitBranch {
    final local$gitBranch = _instance.gitBranch;
    return local$gitBranch == null
        ? CopyWith$Input$StringFilter.stub(_then(_instance))
        : CopyWith$Input$StringFilter(
            local$gitBranch, (e) => call(gitBranch: e));
  }

  CopyWith$Input$StringFilter<TRes> get serverFile {
    final local$serverFile = _instance.serverFile;
    return local$serverFile == null
        ? CopyWith$Input$StringFilter.stub(_then(_instance))
        : CopyWith$Input$StringFilter(
            local$serverFile, (e) => call(serverFile: e));
  }

  CopyWith$Input$DateTimeFilter<TRes> get createdDate {
    final local$createdDate = _instance.createdDate;
    return local$createdDate == null
        ? CopyWith$Input$DateTimeFilter.stub(_then(_instance))
        : CopyWith$Input$DateTimeFilter(
            local$createdDate, (e) => call(createdDate: e));
  }
}

class _CopyWithStubImpl$Input$ServiceConfigFilter<TRes>
    implements CopyWith$Input$ServiceConfigFilter<TRes> {
  _CopyWithStubImpl$Input$ServiceConfigFilter(this._res);

  TRes _res;

  call(
          {Input$StringFilter? serviceId,
          Input$StringFilter? gitRepo,
          Input$StringFilter? gitBranch,
          Input$StringFilter? serverFile,
          Input$DateTimeFilter? createdDate}) =>
      _res;
  CopyWith$Input$StringFilter<TRes> get serviceId =>
      CopyWith$Input$StringFilter.stub(_res);
  CopyWith$Input$StringFilter<TRes> get gitRepo =>
      CopyWith$Input$StringFilter.stub(_res);
  CopyWith$Input$StringFilter<TRes> get gitBranch =>
      CopyWith$Input$StringFilter.stub(_res);
  CopyWith$Input$StringFilter<TRes> get serverFile =>
      CopyWith$Input$StringFilter.stub(_res);
  CopyWith$Input$DateTimeFilter<TRes> get createdDate =>
      CopyWith$Input$DateTimeFilter.stub(_res);
}

class Input$StringFilter {
  factory Input$StringFilter(
          {String? contains, String? regExp, List<String>? isIn}) =>
      Input$StringFilter._({
        if (contains != null) r'contains': contains,
        if (regExp != null) r'regExp': regExp,
        if (isIn != null) r'isIn': isIn,
      });

  Input$StringFilter._(this._$data);

  factory Input$StringFilter.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('contains')) {
      final l$contains = data['contains'];
      result$data['contains'] = (l$contains as String?);
    }
    if (data.containsKey('regExp')) {
      final l$regExp = data['regExp'];
      result$data['regExp'] = (l$regExp as String?);
    }
    if (data.containsKey('isIn')) {
      final l$isIn = data['isIn'];
      result$data['isIn'] =
          (l$isIn as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    return Input$StringFilter._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get contains => (_$data['contains'] as String?);
  String? get regExp => (_$data['regExp'] as String?);
  List<String>? get isIn => (_$data['isIn'] as List<String>?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('contains')) {
      final l$contains = contains;
      result$data['contains'] = l$contains;
    }
    if (_$data.containsKey('regExp')) {
      final l$regExp = regExp;
      result$data['regExp'] = l$regExp;
    }
    if (_$data.containsKey('isIn')) {
      final l$isIn = isIn;
      result$data['isIn'] = l$isIn?.map((e) => e).toList();
    }
    return result$data;
  }

  CopyWith$Input$StringFilter<Input$StringFilter> get copyWith =>
      CopyWith$Input$StringFilter(this, (i) => i);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$StringFilter) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$contains = contains;
    final lOther$contains = other.contains;
    if (_$data.containsKey('contains') !=
        other._$data.containsKey('contains')) {
      return false;
    }
    if (l$contains != lOther$contains) {
      return false;
    }
    final l$regExp = regExp;
    final lOther$regExp = other.regExp;
    if (_$data.containsKey('regExp') != other._$data.containsKey('regExp')) {
      return false;
    }
    if (l$regExp != lOther$regExp) {
      return false;
    }
    final l$isIn = isIn;
    final lOther$isIn = other.isIn;
    if (_$data.containsKey('isIn') != other._$data.containsKey('isIn')) {
      return false;
    }
    if (l$isIn != null && lOther$isIn != null) {
      if (l$isIn.length != lOther$isIn.length) {
        return false;
      }
      for (int i = 0; i < l$isIn.length; i++) {
        final l$isIn$entry = l$isIn[i];
        final lOther$isIn$entry = lOther$isIn[i];
        if (l$isIn$entry != lOther$isIn$entry) {
          return false;
        }
      }
    } else if (l$isIn != lOther$isIn) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$contains = contains;
    final l$regExp = regExp;
    final l$isIn = isIn;
    return Object.hashAll([
      _$data.containsKey('contains') ? l$contains : const {},
      _$data.containsKey('regExp') ? l$regExp : const {},
      _$data.containsKey('isIn')
          ? l$isIn == null
              ? null
              : Object.hashAll(l$isIn.map((v) => v))
          : const {}
    ]);
  }
}

abstract class CopyWith$Input$StringFilter<TRes> {
  factory CopyWith$Input$StringFilter(
          Input$StringFilter instance, TRes Function(Input$StringFilter) then) =
      _CopyWithImpl$Input$StringFilter;

  factory CopyWith$Input$StringFilter.stub(TRes res) =
      _CopyWithStubImpl$Input$StringFilter;

  TRes call({String? contains, String? regExp, List<String>? isIn});
}

class _CopyWithImpl$Input$StringFilter<TRes>
    implements CopyWith$Input$StringFilter<TRes> {
  _CopyWithImpl$Input$StringFilter(this._instance, this._then);

  final Input$StringFilter _instance;

  final TRes Function(Input$StringFilter) _then;

  static const _undefined = {};

  TRes call(
          {Object? contains = _undefined,
          Object? regExp = _undefined,
          Object? isIn = _undefined}) =>
      _then(Input$StringFilter._({
        ..._instance._$data,
        if (contains != _undefined) 'contains': (contains as String?),
        if (regExp != _undefined) 'regExp': (regExp as String?),
        if (isIn != _undefined) 'isIn': (isIn as List<String>?),
      }));
}

class _CopyWithStubImpl$Input$StringFilter<TRes>
    implements CopyWith$Input$StringFilter<TRes> {
  _CopyWithStubImpl$Input$StringFilter(this._res);

  TRes _res;

  call({String? contains, String? regExp, List<String>? isIn}) => _res;
}

class Input$DateTimeFilter {
  factory Input$DateTimeFilter({DateTime? before, DateTime? after}) =>
      Input$DateTimeFilter._({
        if (before != null) r'before': before,
        if (after != null) r'after': after,
      });

  Input$DateTimeFilter._(this._$data);

  factory Input$DateTimeFilter.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('before')) {
      final l$before = data['before'];
      result$data['before'] =
          l$before == null ? null : DateTime.parse((l$before as String));
    }
    if (data.containsKey('after')) {
      final l$after = data['after'];
      result$data['after'] =
          l$after == null ? null : DateTime.parse((l$after as String));
    }
    return Input$DateTimeFilter._(result$data);
  }

  Map<String, dynamic> _$data;

  DateTime? get before => (_$data['before'] as DateTime?);
  DateTime? get after => (_$data['after'] as DateTime?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('before')) {
      final l$before = before;
      result$data['before'] = l$before?.toIso8601String();
    }
    if (_$data.containsKey('after')) {
      final l$after = after;
      result$data['after'] = l$after?.toIso8601String();
    }
    return result$data;
  }

  CopyWith$Input$DateTimeFilter<Input$DateTimeFilter> get copyWith =>
      CopyWith$Input$DateTimeFilter(this, (i) => i);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$DateTimeFilter) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$before = before;
    final lOther$before = other.before;
    if (_$data.containsKey('before') != other._$data.containsKey('before')) {
      return false;
    }
    if (l$before != lOther$before) {
      return false;
    }
    final l$after = after;
    final lOther$after = other.after;
    if (_$data.containsKey('after') != other._$data.containsKey('after')) {
      return false;
    }
    if (l$after != lOther$after) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$before = before;
    final l$after = after;
    return Object.hashAll([
      _$data.containsKey('before') ? l$before : const {},
      _$data.containsKey('after') ? l$after : const {}
    ]);
  }
}

abstract class CopyWith$Input$DateTimeFilter<TRes> {
  factory CopyWith$Input$DateTimeFilter(Input$DateTimeFilter instance,
          TRes Function(Input$DateTimeFilter) then) =
      _CopyWithImpl$Input$DateTimeFilter;

  factory CopyWith$Input$DateTimeFilter.stub(TRes res) =
      _CopyWithStubImpl$Input$DateTimeFilter;

  TRes call({DateTime? before, DateTime? after});
}

class _CopyWithImpl$Input$DateTimeFilter<TRes>
    implements CopyWith$Input$DateTimeFilter<TRes> {
  _CopyWithImpl$Input$DateTimeFilter(this._instance, this._then);

  final Input$DateTimeFilter _instance;

  final TRes Function(Input$DateTimeFilter) _then;

  static const _undefined = {};

  TRes call({Object? before = _undefined, Object? after = _undefined}) =>
      _then(Input$DateTimeFilter._({
        ..._instance._$data,
        if (before != _undefined) 'before': (before as DateTime?),
        if (after != _undefined) 'after': (after as DateTime?),
      }));
}

class _CopyWithStubImpl$Input$DateTimeFilter<TRes>
    implements CopyWith$Input$DateTimeFilter<TRes> {
  _CopyWithStubImpl$Input$DateTimeFilter(this._res);

  TRes _res;

  call({DateTime? before, DateTime? after}) => _res;
}

class Input$ServiceConfigInput {
  factory Input$ServiceConfigInput(
          {required String gitRepo,
          required String gitBranch,
          required String serverFile,
          required List<Input$CliCommandInput> commands}) =>
      Input$ServiceConfigInput._({
        r'gitRepo': gitRepo,
        r'gitBranch': gitBranch,
        r'serverFile': serverFile,
        r'commands': commands,
      });

  Input$ServiceConfigInput._(this._$data);

  factory Input$ServiceConfigInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$gitRepo = data['gitRepo'];
    result$data['gitRepo'] = (l$gitRepo as String);
    final l$gitBranch = data['gitBranch'];
    result$data['gitBranch'] = (l$gitBranch as String);
    final l$serverFile = data['serverFile'];
    result$data['serverFile'] = (l$serverFile as String);
    final l$commands = data['commands'];
    result$data['commands'] = (l$commands as List<dynamic>)
        .map((e) => Input$CliCommandInput.fromJson((e as Map<String, dynamic>)))
        .toList();
    return Input$ServiceConfigInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get gitRepo => (_$data['gitRepo'] as String);
  String get gitBranch => (_$data['gitBranch'] as String);
  String get serverFile => (_$data['serverFile'] as String);
  List<Input$CliCommandInput> get commands =>
      (_$data['commands'] as List<Input$CliCommandInput>);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$gitRepo = gitRepo;
    result$data['gitRepo'] = l$gitRepo;
    final l$gitBranch = gitBranch;
    result$data['gitBranch'] = l$gitBranch;
    final l$serverFile = serverFile;
    result$data['serverFile'] = l$serverFile;
    final l$commands = commands;
    result$data['commands'] = l$commands.map((e) => e.toJson()).toList();
    return result$data;
  }

  CopyWith$Input$ServiceConfigInput<Input$ServiceConfigInput> get copyWith =>
      CopyWith$Input$ServiceConfigInput(this, (i) => i);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$ServiceConfigInput) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$gitRepo = gitRepo;
    final lOther$gitRepo = other.gitRepo;
    if (l$gitRepo != lOther$gitRepo) {
      return false;
    }
    final l$gitBranch = gitBranch;
    final lOther$gitBranch = other.gitBranch;
    if (l$gitBranch != lOther$gitBranch) {
      return false;
    }
    final l$serverFile = serverFile;
    final lOther$serverFile = other.serverFile;
    if (l$serverFile != lOther$serverFile) {
      return false;
    }
    final l$commands = commands;
    final lOther$commands = other.commands;
    if (l$commands.length != lOther$commands.length) {
      return false;
    }
    for (int i = 0; i < l$commands.length; i++) {
      final l$commands$entry = l$commands[i];
      final lOther$commands$entry = lOther$commands[i];
      if (l$commands$entry != lOther$commands$entry) {
        return false;
      }
    }
    return true;
  }

  @override
  int get hashCode {
    final l$gitRepo = gitRepo;
    final l$gitBranch = gitBranch;
    final l$serverFile = serverFile;
    final l$commands = commands;
    return Object.hashAll([
      l$gitRepo,
      l$gitBranch,
      l$serverFile,
      Object.hashAll(l$commands.map((v) => v))
    ]);
  }
}

abstract class CopyWith$Input$ServiceConfigInput<TRes> {
  factory CopyWith$Input$ServiceConfigInput(Input$ServiceConfigInput instance,
          TRes Function(Input$ServiceConfigInput) then) =
      _CopyWithImpl$Input$ServiceConfigInput;

  factory CopyWith$Input$ServiceConfigInput.stub(TRes res) =
      _CopyWithStubImpl$Input$ServiceConfigInput;

  TRes call(
      {String? gitRepo,
      String? gitBranch,
      String? serverFile,
      List<Input$CliCommandInput>? commands});
  TRes commands(
      Iterable<Input$CliCommandInput> Function(
              Iterable<CopyWith$Input$CliCommandInput<Input$CliCommandInput>>)
          _fn);
}

class _CopyWithImpl$Input$ServiceConfigInput<TRes>
    implements CopyWith$Input$ServiceConfigInput<TRes> {
  _CopyWithImpl$Input$ServiceConfigInput(this._instance, this._then);

  final Input$ServiceConfigInput _instance;

  final TRes Function(Input$ServiceConfigInput) _then;

  static const _undefined = {};

  TRes call(
          {Object? gitRepo = _undefined,
          Object? gitBranch = _undefined,
          Object? serverFile = _undefined,
          Object? commands = _undefined}) =>
      _then(Input$ServiceConfigInput._({
        ..._instance._$data,
        if (gitRepo != _undefined && gitRepo != null)
          'gitRepo': (gitRepo as String),
        if (gitBranch != _undefined && gitBranch != null)
          'gitBranch': (gitBranch as String),
        if (serverFile != _undefined && serverFile != null)
          'serverFile': (serverFile as String),
        if (commands != _undefined && commands != null)
          'commands': (commands as List<Input$CliCommandInput>),
      }));
  TRes commands(
          Iterable<Input$CliCommandInput> Function(
                  Iterable<
                      CopyWith$Input$CliCommandInput<Input$CliCommandInput>>)
              _fn) =>
      call(
          commands: _fn(_instance.commands
                  .map((e) => CopyWith$Input$CliCommandInput(e, (i) => i)))
              .toList());
}

class _CopyWithStubImpl$Input$ServiceConfigInput<TRes>
    implements CopyWith$Input$ServiceConfigInput<TRes> {
  _CopyWithStubImpl$Input$ServiceConfigInput(this._res);

  TRes _res;

  call(
          {String? gitRepo,
          String? gitBranch,
          String? serverFile,
          List<Input$CliCommandInput>? commands}) =>
      _res;
  commands(_fn) => _res;
}

class Input$CliCommandInput {
  factory Input$CliCommandInput(
          {required String name,
          required List<String> command,
          required List<Input$CliCommandVariableInput> variables}) =>
      Input$CliCommandInput._({
        r'name': name,
        r'command': command,
        r'variables': variables,
      });

  Input$CliCommandInput._(this._$data);

  factory Input$CliCommandInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    final l$command = data['command'];
    result$data['command'] =
        (l$command as List<dynamic>).map((e) => (e as String)).toList();
    final l$variables = data['variables'];
    result$data['variables'] = (l$variables as List<dynamic>)
        .map((e) =>
            Input$CliCommandVariableInput.fromJson((e as Map<String, dynamic>)))
        .toList();
    return Input$CliCommandInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get name => (_$data['name'] as String);
  List<String> get command => (_$data['command'] as List<String>);
  List<Input$CliCommandVariableInput> get variables =>
      (_$data['variables'] as List<Input$CliCommandVariableInput>);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$name = name;
    result$data['name'] = l$name;
    final l$command = command;
    result$data['command'] = l$command.map((e) => e).toList();
    final l$variables = variables;
    result$data['variables'] = l$variables.map((e) => e.toJson()).toList();
    return result$data;
  }

  CopyWith$Input$CliCommandInput<Input$CliCommandInput> get copyWith =>
      CopyWith$Input$CliCommandInput(this, (i) => i);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$CliCommandInput) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$command = command;
    final lOther$command = other.command;
    if (l$command.length != lOther$command.length) {
      return false;
    }
    for (int i = 0; i < l$command.length; i++) {
      final l$command$entry = l$command[i];
      final lOther$command$entry = lOther$command[i];
      if (l$command$entry != lOther$command$entry) {
        return false;
      }
    }
    final l$variables = variables;
    final lOther$variables = other.variables;
    if (l$variables.length != lOther$variables.length) {
      return false;
    }
    for (int i = 0; i < l$variables.length; i++) {
      final l$variables$entry = l$variables[i];
      final lOther$variables$entry = lOther$variables[i];
      if (l$variables$entry != lOther$variables$entry) {
        return false;
      }
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$command = command;
    final l$variables = variables;
    return Object.hashAll([
      l$name,
      Object.hashAll(l$command.map((v) => v)),
      Object.hashAll(l$variables.map((v) => v))
    ]);
  }
}

abstract class CopyWith$Input$CliCommandInput<TRes> {
  factory CopyWith$Input$CliCommandInput(Input$CliCommandInput instance,
          TRes Function(Input$CliCommandInput) then) =
      _CopyWithImpl$Input$CliCommandInput;

  factory CopyWith$Input$CliCommandInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CliCommandInput;

  TRes call(
      {String? name,
      List<String>? command,
      List<Input$CliCommandVariableInput>? variables});
  TRes variables(
      Iterable<Input$CliCommandVariableInput> Function(
              Iterable<
                  CopyWith$Input$CliCommandVariableInput<
                      Input$CliCommandVariableInput>>)
          _fn);
}

class _CopyWithImpl$Input$CliCommandInput<TRes>
    implements CopyWith$Input$CliCommandInput<TRes> {
  _CopyWithImpl$Input$CliCommandInput(this._instance, this._then);

  final Input$CliCommandInput _instance;

  final TRes Function(Input$CliCommandInput) _then;

  static const _undefined = {};

  TRes call(
          {Object? name = _undefined,
          Object? command = _undefined,
          Object? variables = _undefined}) =>
      _then(Input$CliCommandInput._({
        ..._instance._$data,
        if (name != _undefined && name != null) 'name': (name as String),
        if (command != _undefined && command != null)
          'command': (command as List<String>),
        if (variables != _undefined && variables != null)
          'variables': (variables as List<Input$CliCommandVariableInput>),
      }));
  TRes variables(
          Iterable<Input$CliCommandVariableInput> Function(
                  Iterable<
                      CopyWith$Input$CliCommandVariableInput<
                          Input$CliCommandVariableInput>>)
              _fn) =>
      call(
          variables: _fn(_instance.variables.map(
                  (e) => CopyWith$Input$CliCommandVariableInput(e, (i) => i)))
              .toList());
}

class _CopyWithStubImpl$Input$CliCommandInput<TRes>
    implements CopyWith$Input$CliCommandInput<TRes> {
  _CopyWithStubImpl$Input$CliCommandInput(this._res);

  TRes _res;

  call(
          {String? name,
          List<String>? command,
          List<Input$CliCommandVariableInput>? variables}) =>
      _res;
  variables(_fn) => _res;
}

class Input$CliCommandVariableInput {
  factory Input$CliCommandVariableInput(
          {required Enum$CliCommandVariableType type, required String value}) =>
      Input$CliCommandVariableInput._({
        r'type': type,
        r'value': value,
      });

  Input$CliCommandVariableInput._(this._$data);

  factory Input$CliCommandVariableInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$type = data['type'];
    result$data['type'] =
        fromJson$Enum$CliCommandVariableType((l$type as String));
    final l$value = data['value'];
    result$data['value'] = (l$value as String);
    return Input$CliCommandVariableInput._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$CliCommandVariableType get type =>
      (_$data['type'] as Enum$CliCommandVariableType);
  String get value => (_$data['value'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$type = type;
    result$data['type'] = toJson$Enum$CliCommandVariableType(l$type);
    final l$value = value;
    result$data['value'] = l$value;
    return result$data;
  }

  CopyWith$Input$CliCommandVariableInput<Input$CliCommandVariableInput>
      get copyWith => CopyWith$Input$CliCommandVariableInput(this, (i) => i);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$CliCommandVariableInput) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$value = value;
    final lOther$value = other.value;
    if (l$value != lOther$value) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$type = type;
    final l$value = value;
    return Object.hashAll([l$type, l$value]);
  }
}

abstract class CopyWith$Input$CliCommandVariableInput<TRes> {
  factory CopyWith$Input$CliCommandVariableInput(
          Input$CliCommandVariableInput instance,
          TRes Function(Input$CliCommandVariableInput) then) =
      _CopyWithImpl$Input$CliCommandVariableInput;

  factory CopyWith$Input$CliCommandVariableInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CliCommandVariableInput;

  TRes call({Enum$CliCommandVariableType? type, String? value});
}

class _CopyWithImpl$Input$CliCommandVariableInput<TRes>
    implements CopyWith$Input$CliCommandVariableInput<TRes> {
  _CopyWithImpl$Input$CliCommandVariableInput(this._instance, this._then);

  final Input$CliCommandVariableInput _instance;

  final TRes Function(Input$CliCommandVariableInput) _then;

  static const _undefined = {};

  TRes call({Object? type = _undefined, Object? value = _undefined}) =>
      _then(Input$CliCommandVariableInput._({
        ..._instance._$data,
        if (type != _undefined && type != null)
          'type': (type as Enum$CliCommandVariableType),
        if (value != _undefined && value != null) 'value': (value as String),
      }));
}

class _CopyWithStubImpl$Input$CliCommandVariableInput<TRes>
    implements CopyWith$Input$CliCommandVariableInput<TRes> {
  _CopyWithStubImpl$Input$CliCommandVariableInput(this._res);

  TRes _res;

  call({Enum$CliCommandVariableType? type, String? value}) => _res;
}

enum Enum$CliCommandVariableType { environment, constant, execution, $unknown }

String toJson$Enum$CliCommandVariableType(Enum$CliCommandVariableType e) {
  switch (e) {
    case Enum$CliCommandVariableType.environment:
      return r'environment';
    case Enum$CliCommandVariableType.constant:
      return r'constant';
    case Enum$CliCommandVariableType.execution:
      return r'execution';
    case Enum$CliCommandVariableType.$unknown:
      return r'$unknown';
  }
}

Enum$CliCommandVariableType fromJson$Enum$CliCommandVariableType(String value) {
  switch (value) {
    case r'environment':
      return Enum$CliCommandVariableType.environment;
    case r'constant':
      return Enum$CliCommandVariableType.constant;
    case r'execution':
      return Enum$CliCommandVariableType.execution;
    default:
      return Enum$CliCommandVariableType.$unknown;
  }
}

enum Enum$CompilationStatus { pending, started, error, success, $unknown }

String toJson$Enum$CompilationStatus(Enum$CompilationStatus e) {
  switch (e) {
    case Enum$CompilationStatus.pending:
      return r'pending';
    case Enum$CompilationStatus.started:
      return r'started';
    case Enum$CompilationStatus.error:
      return r'error';
    case Enum$CompilationStatus.success:
      return r'success';
    case Enum$CompilationStatus.$unknown:
      return r'$unknown';
  }
}

Enum$CompilationStatus fromJson$Enum$CompilationStatus(String value) {
  switch (value) {
    case r'pending':
      return Enum$CompilationStatus.pending;
    case r'started':
      return Enum$CompilationStatus.started;
    case r'error':
      return Enum$CompilationStatus.error;
    case r'success':
      return Enum$CompilationStatus.success;
    default:
      return Enum$CompilationStatus.$unknown;
  }
}

const possibleTypesMap = {
  'CompilationEvent': {
    'CompilationEventCreated',
    'CompilationEventCompilation',
    'CompilationEventCreationError',
    'CompilationEventLog',
    'CompilationEventExecution',
    'CompilationEventPartialExecution'
  }
};
