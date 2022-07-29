import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:json_annotation/json_annotation.dart';
part 'api.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Fragment$CompilerLogF {
  Fragment$CompilerLogF(
      {required this.message,
      required this.time,
      this.result,
      required this.$__typename});

  @override
  factory Fragment$CompilerLogF.fromJson(Map<String, dynamic> json) =>
      _$Fragment$CompilerLogFFromJson(json);

  final String message;

  final DateTime time;

  final Fragment$ProcessExecResultF? result;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Fragment$CompilerLogFToJson(this);
  int get hashCode {
    final l$message = message;
    final l$time = time;
    final l$result = result;
    final l$$__typename = $__typename;
    return Object.hashAll([l$message, l$time, l$result, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Fragment$CompilerLogF) || runtimeType != other.runtimeType)
      return false;
    final l$message = message;
    final lOther$message = other.message;
    if (l$message != lOther$message) return false;
    final l$time = time;
    final lOther$time = other.time;
    if (l$time != lOther$time) return false;
    final l$result = result;
    final lOther$result = other.result;
    if (l$result != lOther$result) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Fragment$CompilerLogF on Fragment$CompilerLogF {
  CopyWith$Fragment$CompilerLogF<Fragment$CompilerLogF> get copyWith =>
      CopyWith$Fragment$CompilerLogF(this, (i) => i);
}

abstract class CopyWith$Fragment$CompilerLogF<TRes> {
  factory CopyWith$Fragment$CompilerLogF(Fragment$CompilerLogF instance,
          TRes Function(Fragment$CompilerLogF) then) =
      _CopyWithImpl$Fragment$CompilerLogF;

  factory CopyWith$Fragment$CompilerLogF.stub(TRes res) =
      _CopyWithStubImpl$Fragment$CompilerLogF;

  TRes call(
      {String? message,
      DateTime? time,
      Fragment$ProcessExecResultF? result,
      String? $__typename});
  CopyWith$Fragment$ProcessExecResultF<TRes> get result;
}

class _CopyWithImpl$Fragment$CompilerLogF<TRes>
    implements CopyWith$Fragment$CompilerLogF<TRes> {
  _CopyWithImpl$Fragment$CompilerLogF(this._instance, this._then);

  final Fragment$CompilerLogF _instance;

  final TRes Function(Fragment$CompilerLogF) _then;

  static const _undefined = {};

  TRes call(
          {Object? message = _undefined,
          Object? time = _undefined,
          Object? result = _undefined,
          Object? $__typename = _undefined}) =>
      _then(Fragment$CompilerLogF(
          message: message == _undefined || message == null
              ? _instance.message
              : (message as String),
          time: time == _undefined || time == null
              ? _instance.time
              : (time as DateTime),
          result: result == _undefined
              ? _instance.result
              : (result as Fragment$ProcessExecResultF?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
  CopyWith$Fragment$ProcessExecResultF<TRes> get result {
    final local$result = _instance.result;
    return local$result == null
        ? CopyWith$Fragment$ProcessExecResultF.stub(_then(_instance))
        : CopyWith$Fragment$ProcessExecResultF(
            local$result, (e) => call(result: e));
  }
}

class _CopyWithStubImpl$Fragment$CompilerLogF<TRes>
    implements CopyWith$Fragment$CompilerLogF<TRes> {
  _CopyWithStubImpl$Fragment$CompilerLogF(this._res);

  TRes _res;

  call(
          {String? message,
          DateTime? time,
          Fragment$ProcessExecResultF? result,
          String? $__typename}) =>
      _res;
  CopyWith$Fragment$ProcessExecResultF<TRes> get result =>
      CopyWith$Fragment$ProcessExecResultF.stub(_res);
}

const fragmentDefinitionCompilerLogF = FragmentDefinitionNode(
    name: NameNode(value: 'CompilerLogF'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
            name: NameNode(value: 'CompilerLog'), isNonNull: false)),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
          name: NameNode(value: 'message'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      FieldNode(
          name: NameNode(value: 'time'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      FieldNode(
          name: NameNode(value: 'result'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: SelectionSetNode(selections: [
            FragmentSpreadNode(
                name: NameNode(value: 'ProcessExecResultF'), directives: []),
            FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null)
          ])),
      FieldNode(
          name: NameNode(value: '__typename'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null)
    ]));
const documentNodeFragmentCompilerLogF = DocumentNode(definitions: [
  fragmentDefinitionCompilerLogF,
  fragmentDefinitionProcessExecResultF,
]);

extension ClientExtension$Fragment$CompilerLogF on graphql.GraphQLClient {
  void writeFragment$CompilerLogF(
          {required Fragment$CompilerLogF data,
          required Map<String, dynamic> idFields,
          bool broadcast = true}) =>
      this.writeFragment(
          graphql.FragmentRequest(
              idFields: idFields,
              fragment: const graphql.Fragment(
                  fragmentName: 'CompilerLogF',
                  document: documentNodeFragmentCompilerLogF)),
          data: data.toJson(),
          broadcast: broadcast);
  Fragment$CompilerLogF? readFragment$CompilerLogF(
      {required Map<String, dynamic> idFields, bool optimistic = true}) {
    final result = this.readFragment(
        graphql.FragmentRequest(
            idFields: idFields,
            fragment: const graphql.Fragment(
                fragmentName: 'CompilerLogF',
                document: documentNodeFragmentCompilerLogF)),
        optimistic: optimistic);
    return result == null ? null : Fragment$CompilerLogF.fromJson(result);
  }
}

@JsonSerializable(explicitToJson: true)
class Fragment$ProcessExecResultF {
  Fragment$ProcessExecResultF(
      {required this.exitCode,
      required this.pid,
      required this.stderr,
      required this.stdout,
      required this.$__typename});

  @override
  factory Fragment$ProcessExecResultF.fromJson(Map<String, dynamic> json) =>
      _$Fragment$ProcessExecResultFFromJson(json);

  final int exitCode;

  final int pid;

  final String stderr;

  final String stdout;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Fragment$ProcessExecResultFToJson(this);
  int get hashCode {
    final l$exitCode = exitCode;
    final l$pid = pid;
    final l$stderr = stderr;
    final l$stdout = stdout;
    final l$$__typename = $__typename;
    return Object.hashAll(
        [l$exitCode, l$pid, l$stderr, l$stdout, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Fragment$ProcessExecResultF) ||
        runtimeType != other.runtimeType) return false;
    final l$exitCode = exitCode;
    final lOther$exitCode = other.exitCode;
    if (l$exitCode != lOther$exitCode) return false;
    final l$pid = pid;
    final lOther$pid = other.pid;
    if (l$pid != lOther$pid) return false;
    final l$stderr = stderr;
    final lOther$stderr = other.stderr;
    if (l$stderr != lOther$stderr) return false;
    final l$stdout = stdout;
    final lOther$stdout = other.stdout;
    if (l$stdout != lOther$stdout) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Fragment$ProcessExecResultF
    on Fragment$ProcessExecResultF {
  CopyWith$Fragment$ProcessExecResultF<Fragment$ProcessExecResultF>
      get copyWith => CopyWith$Fragment$ProcessExecResultF(this, (i) => i);
}

abstract class CopyWith$Fragment$ProcessExecResultF<TRes> {
  factory CopyWith$Fragment$ProcessExecResultF(
          Fragment$ProcessExecResultF instance,
          TRes Function(Fragment$ProcessExecResultF) then) =
      _CopyWithImpl$Fragment$ProcessExecResultF;

  factory CopyWith$Fragment$ProcessExecResultF.stub(TRes res) =
      _CopyWithStubImpl$Fragment$ProcessExecResultF;

  TRes call(
      {int? exitCode,
      int? pid,
      String? stderr,
      String? stdout,
      String? $__typename});
}

class _CopyWithImpl$Fragment$ProcessExecResultF<TRes>
    implements CopyWith$Fragment$ProcessExecResultF<TRes> {
  _CopyWithImpl$Fragment$ProcessExecResultF(this._instance, this._then);

  final Fragment$ProcessExecResultF _instance;

  final TRes Function(Fragment$ProcessExecResultF) _then;

  static const _undefined = {};

  TRes call(
          {Object? exitCode = _undefined,
          Object? pid = _undefined,
          Object? stderr = _undefined,
          Object? stdout = _undefined,
          Object? $__typename = _undefined}) =>
      _then(Fragment$ProcessExecResultF(
          exitCode: exitCode == _undefined || exitCode == null
              ? _instance.exitCode
              : (exitCode as int),
          pid: pid == _undefined || pid == null ? _instance.pid : (pid as int),
          stderr: stderr == _undefined || stderr == null
              ? _instance.stderr
              : (stderr as String),
          stdout: stdout == _undefined || stdout == null
              ? _instance.stdout
              : (stdout as String),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Fragment$ProcessExecResultF<TRes>
    implements CopyWith$Fragment$ProcessExecResultF<TRes> {
  _CopyWithStubImpl$Fragment$ProcessExecResultF(this._res);

  TRes _res;

  call(
          {int? exitCode,
          int? pid,
          String? stderr,
          String? stdout,
          String? $__typename}) =>
      _res;
}

const fragmentDefinitionProcessExecResultF = FragmentDefinitionNode(
    name: NameNode(value: 'ProcessExecResultF'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
            name: NameNode(value: 'ProcessExecResult'), isNonNull: false)),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
          name: NameNode(value: 'exitCode'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      FieldNode(
          name: NameNode(value: 'pid'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      FieldNode(
          name: NameNode(value: 'stderr'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      FieldNode(
          name: NameNode(value: 'stdout'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      FieldNode(
          name: NameNode(value: '__typename'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null)
    ]));
const documentNodeFragmentProcessExecResultF = DocumentNode(definitions: [
  fragmentDefinitionProcessExecResultF,
]);

extension ClientExtension$Fragment$ProcessExecResultF on graphql.GraphQLClient {
  void writeFragment$ProcessExecResultF(
          {required Fragment$ProcessExecResultF data,
          required Map<String, dynamic> idFields,
          bool broadcast = true}) =>
      this.writeFragment(
          graphql.FragmentRequest(
              idFields: idFields,
              fragment: const graphql.Fragment(
                  fragmentName: 'ProcessExecResultF',
                  document: documentNodeFragmentProcessExecResultF)),
          data: data.toJson(),
          broadcast: broadcast);
  Fragment$ProcessExecResultF? readFragment$ProcessExecResultF(
      {required Map<String, dynamic> idFields, bool optimistic = true}) {
    final result = this.readFragment(
        graphql.FragmentRequest(
            idFields: idFields,
            fragment: const graphql.Fragment(
                fragmentName: 'ProcessExecResultF',
                document: documentNodeFragmentProcessExecResultF)),
        optimistic: optimistic);
    return result == null ? null : Fragment$ProcessExecResultF.fromJson(result);
  }
}

@JsonSerializable(explicitToJson: true)
class Query$topResult {
  Query$topResult({this.topOutput, required this.$__typename});

  @override
  factory Query$topResult.fromJson(Map<String, dynamic> json) =>
      _$Query$topResultFromJson(json);

  final String? topOutput;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Query$topResultToJson(this);
  int get hashCode {
    final l$topOutput = topOutput;
    final l$$__typename = $__typename;
    return Object.hashAll([l$topOutput, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$topResult) || runtimeType != other.runtimeType)
      return false;
    final l$topOutput = topOutput;
    final lOther$topOutput = other.topOutput;
    if (l$topOutput != lOther$topOutput) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$topResult on Query$topResult {
  CopyWith$Query$topResult<Query$topResult> get copyWith =>
      CopyWith$Query$topResult(this, (i) => i);
}

abstract class CopyWith$Query$topResult<TRes> {
  factory CopyWith$Query$topResult(
          Query$topResult instance, TRes Function(Query$topResult) then) =
      _CopyWithImpl$Query$topResult;

  factory CopyWith$Query$topResult.stub(TRes res) =
      _CopyWithStubImpl$Query$topResult;

  TRes call({String? topOutput, String? $__typename});
}

class _CopyWithImpl$Query$topResult<TRes>
    implements CopyWith$Query$topResult<TRes> {
  _CopyWithImpl$Query$topResult(this._instance, this._then);

  final Query$topResult _instance;

  final TRes Function(Query$topResult) _then;

  static const _undefined = {};

  TRes call(
          {Object? topOutput = _undefined, Object? $__typename = _undefined}) =>
      _then(Query$topResult(
          topOutput: topOutput == _undefined
              ? _instance.topOutput
              : (topOutput as String?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$topResult<TRes>
    implements CopyWith$Query$topResult<TRes> {
  _CopyWithStubImpl$Query$topResult(this._res);

  TRes _res;

  call({String? topOutput, String? $__typename}) => _res;
}

const documentNodeQuerytopResult = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'topResult'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'topOutput'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ])),
]);
Query$topResult _parserFn$Query$topResult(Map<String, dynamic> data) =>
    Query$topResult.fromJson(data);

class Options$Query$topResult extends graphql.QueryOptions<Query$topResult> {
  Options$Query$topResult(
      {String? operationName,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      Duration? pollInterval,
      graphql.Context? context})
      : super(
            operationName: operationName,
            fetchPolicy: fetchPolicy,
            errorPolicy: errorPolicy,
            cacheRereadPolicy: cacheRereadPolicy,
            optimisticResult: optimisticResult,
            pollInterval: pollInterval,
            context: context,
            document: documentNodeQuerytopResult,
            parserFn: _parserFn$Query$topResult);
}

class WatchOptions$Query$topResult
    extends graphql.WatchQueryOptions<Query$topResult> {
  WatchOptions$Query$topResult(
      {String? operationName,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      graphql.Context? context,
      Duration? pollInterval,
      bool? eagerlyFetchResults,
      bool carryForwardDataOnException = true,
      bool fetchResults = false})
      : super(
            operationName: operationName,
            fetchPolicy: fetchPolicy,
            errorPolicy: errorPolicy,
            cacheRereadPolicy: cacheRereadPolicy,
            optimisticResult: optimisticResult,
            context: context,
            document: documentNodeQuerytopResult,
            pollInterval: pollInterval,
            eagerlyFetchResults: eagerlyFetchResults,
            carryForwardDataOnException: carryForwardDataOnException,
            fetchResults: fetchResults,
            parserFn: _parserFn$Query$topResult);
}

class FetchMoreOptions$Query$topResult extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$topResult({required graphql.UpdateQuery updateQuery})
      : super(updateQuery: updateQuery, document: documentNodeQuerytopResult);
}

extension ClientExtension$Query$topResult on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$topResult>> query$topResult(
          [Options$Query$topResult? options]) async =>
      await this.query(options ?? Options$Query$topResult());
  graphql.ObservableQuery<Query$topResult> watchQuery$topResult(
          [WatchOptions$Query$topResult? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$topResult());
  void writeQuery$topResult(
          {required Query$topResult data, bool broadcast = true}) =>
      this.writeQuery(
          graphql.Request(
              operation:
                  graphql.Operation(document: documentNodeQuerytopResult)),
          data: data.toJson(),
          broadcast: broadcast);
  Query$topResult? readQuery$topResult({bool optimistic = true}) {
    final result = this.readQuery(
        graphql.Request(
            operation: graphql.Operation(document: documentNodeQuerytopResult)),
        optimistic: optimistic);
    return result == null ? null : Query$topResult.fromJson(result);
  }
}

@JsonSerializable(explicitToJson: true)
class Mutation$startService {
  Mutation$startService(
      {required this.startService, required this.$__typename});

  @override
  factory Mutation$startService.fromJson(Map<String, dynamic> json) =>
      _$Mutation$startServiceFromJson(json);

  final List<Fragment$CompilerLogF> startService;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Mutation$startServiceToJson(this);
  int get hashCode {
    final l$startService = startService;
    final l$$__typename = $__typename;
    return Object.hashAll(
        [Object.hashAll(l$startService.map((v) => v)), l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Mutation$startService) || runtimeType != other.runtimeType)
      return false;
    final l$startService = startService;
    final lOther$startService = other.startService;
    if (l$startService.length != lOther$startService.length) return false;
    for (int i = 0; i < l$startService.length; i++) {
      final l$startService$entry = l$startService[i];
      final lOther$startService$entry = lOther$startService[i];
      if (l$startService$entry != lOther$startService$entry) return false;
    }

    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Mutation$startService on Mutation$startService {
  CopyWith$Mutation$startService<Mutation$startService> get copyWith =>
      CopyWith$Mutation$startService(this, (i) => i);
}

abstract class CopyWith$Mutation$startService<TRes> {
  factory CopyWith$Mutation$startService(Mutation$startService instance,
          TRes Function(Mutation$startService) then) =
      _CopyWithImpl$Mutation$startService;

  factory CopyWith$Mutation$startService.stub(TRes res) =
      _CopyWithStubImpl$Mutation$startService;

  TRes call({List<Fragment$CompilerLogF>? startService, String? $__typename});
  TRes startService(
      Iterable<Fragment$CompilerLogF> Function(
              Iterable<CopyWith$Fragment$CompilerLogF<Fragment$CompilerLogF>>)
          _fn);
}

class _CopyWithImpl$Mutation$startService<TRes>
    implements CopyWith$Mutation$startService<TRes> {
  _CopyWithImpl$Mutation$startService(this._instance, this._then);

  final Mutation$startService _instance;

  final TRes Function(Mutation$startService) _then;

  static const _undefined = {};

  TRes call(
          {Object? startService = _undefined,
          Object? $__typename = _undefined}) =>
      _then(Mutation$startService(
          startService: startService == _undefined || startService == null
              ? _instance.startService
              : (startService as List<Fragment$CompilerLogF>),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
  TRes startService(
          Iterable<Fragment$CompilerLogF> Function(
                  Iterable<
                      CopyWith$Fragment$CompilerLogF<Fragment$CompilerLogF>>)
              _fn) =>
      call(
          startService: _fn(_instance.startService
                  .map((e) => CopyWith$Fragment$CompilerLogF(e, (i) => i)))
              .toList());
}

class _CopyWithStubImpl$Mutation$startService<TRes>
    implements CopyWith$Mutation$startService<TRes> {
  _CopyWithStubImpl$Mutation$startService(this._res);

  TRes _res;

  call({List<Fragment$CompilerLogF>? startService, String? $__typename}) =>
      _res;
  startService(_fn) => _res;
}

const documentNodeMutationstartService = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'startService'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'startService'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                  name: NameNode(value: 'CompilerLogF'), directives: []),
              FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ])),
        FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ])),
  fragmentDefinitionCompilerLogF,
  fragmentDefinitionProcessExecResultF,
]);
Mutation$startService _parserFn$Mutation$startService(
        Map<String, dynamic> data) =>
    Mutation$startService.fromJson(data);
typedef OnMutationCompleted$Mutation$startService = FutureOr<void> Function(
    dynamic, Mutation$startService?);

class Options$Mutation$startService
    extends graphql.MutationOptions<Mutation$startService> {
  Options$Mutation$startService(
      {String? operationName,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      graphql.Context? context,
      OnMutationCompleted$Mutation$startService? onCompleted,
      graphql.OnMutationUpdate<Mutation$startService>? update,
      graphql.OnError? onError})
      : onCompletedWithParsed = onCompleted,
        super(
            operationName: operationName,
            fetchPolicy: fetchPolicy,
            errorPolicy: errorPolicy,
            cacheRereadPolicy: cacheRereadPolicy,
            optimisticResult: optimisticResult,
            context: context,
            onCompleted: onCompleted == null
                ? null
                : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$startService(data)),
            update: update,
            onError: onError,
            document: documentNodeMutationstartService,
            parserFn: _parserFn$Mutation$startService);

  final OnMutationCompleted$Mutation$startService? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed
      ];
}

class WatchOptions$Mutation$startService
    extends graphql.WatchQueryOptions<Mutation$startService> {
  WatchOptions$Mutation$startService(
      {String? operationName,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      graphql.Context? context,
      Duration? pollInterval,
      bool? eagerlyFetchResults,
      bool carryForwardDataOnException = true,
      bool fetchResults = false})
      : super(
            operationName: operationName,
            fetchPolicy: fetchPolicy,
            errorPolicy: errorPolicy,
            cacheRereadPolicy: cacheRereadPolicy,
            optimisticResult: optimisticResult,
            context: context,
            document: documentNodeMutationstartService,
            pollInterval: pollInterval,
            eagerlyFetchResults: eagerlyFetchResults,
            carryForwardDataOnException: carryForwardDataOnException,
            fetchResults: fetchResults,
            parserFn: _parserFn$Mutation$startService);
}

extension ClientExtension$Mutation$startService on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$startService>> mutate$startService(
          [Options$Mutation$startService? options]) async =>
      await this.mutate(options ?? Options$Mutation$startService());
  graphql.ObservableQuery<Mutation$startService> watchMutation$startService(
          [WatchOptions$Mutation$startService? options]) =>
      this.watchMutation(options ?? WatchOptions$Mutation$startService());
}
