// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compiler_models.dart';

// **************************************************************************
// _GraphQLGenerator
// **************************************************************************

final compilerLogSerializer = SerializerValue<CompilerLog>(
  key: "CompilerLog",
  fromJson: (ctx, json) => CompilerLog.fromJson(json), // _$CompilerLogFromJson,
  // toJson: (m) => _$CompilerLogToJson(m as CompilerLog),
);
final _compilerLogGraphQLType =
    HotReloadableDefinition<GraphQLObjectType<CompilerLog>>((setValue) {
  final __name = 'CompilerLog';

  final __compilerLogGraphQLType =
      objectType<CompilerLog>(__name, isInterface: false, interfaces: []);

  setValue(__compilerLogGraphQLType);
  __compilerLogGraphQLType.fields.addAll(
    [
      graphQLString.nonNull().field('toString', resolve: (obj, ctx) {
        final args = ctx.args;

        return obj.toString();
      }),
      graphQLString
          .nonNull()
          .field('message', resolve: (obj, ctx) => obj.message),
      graphQLDate.nonNull().field('time', resolve: (obj, ctx) => obj.time),
      processExecResultGraphQLType.field('result',
          resolve: (obj, ctx) => obj.result)
    ],
  );

  return __compilerLogGraphQLType;
});

/// Auto-generated from [CompilerLog].
GraphQLObjectType<CompilerLog> get compilerLogGraphQLType =>
    _compilerLogGraphQLType.value;

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
