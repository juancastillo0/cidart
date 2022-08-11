// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compilation_event.dart';

// **************************************************************************
// _GraphQLGenerator
// **************************************************************************

/// Generated from [CompilationEvent]
GraphQLUnionType<CompilationEvent> get compilationEventGraphQLType =>
    _compilationEventGraphQLType.value;

final _compilationEventGraphQLType =
    HotReloadableDefinition<GraphQLUnionType<CompilationEvent>>((setValue) {
  final type = GraphQLUnionType<CompilationEvent>(
    'CompilationEvent',
    const [],
  );
  setValue(type);
  type.possibleTypes.addAll([
    compilationEventCreatedGraphQLType,
    compilationEventCompilationGraphQLType,
    compilationEventCreationErrorGraphQLType,
    compilationEventLogGraphQLType,
    compilationEventExecutionGraphQLType,
    compilationEventPartialExecutionGraphQLType,
  ]);
  return type;
});

final _compilationEventCreatedGraphQLType =
    HotReloadableDefinition<GraphQLObjectType<_CompilationEventCreated>>(
        (setValue) {
  final __name = 'CompilationEventCreated';

  final __compilationEventCreatedGraphQLType =
      objectType<_CompilationEventCreated>(__name,
          isInterface: false, interfaces: []);

  setValue(__compilationEventCreatedGraphQLType);
  __compilationEventCreatedGraphQLType.fields.addAll(
    [
      serviceConfigGraphQLType
          .nonNull()
          .field('service', resolve: (obj, ctx) => obj.service)
    ],
  );

  return __compilationEventCreatedGraphQLType;
});

/// Auto-generated from [_CompilationEventCreated].
GraphQLObjectType<_CompilationEventCreated>
    get compilationEventCreatedGraphQLType =>
        _compilationEventCreatedGraphQLType.value;

final _compilationEventCompilationGraphQLType =
    HotReloadableDefinition<GraphQLObjectType<_CompilationEventCompilation>>(
        (setValue) {
  final __name = 'CompilationEventCompilation';

  final __compilationEventCompilationGraphQLType =
      objectType<_CompilationEventCompilation>(__name,
          isInterface: false, interfaces: []);

  setValue(__compilationEventCompilationGraphQLType);
  __compilationEventCompilationGraphQLType.fields.addAll(
    [
      compilationGraphQLType
          .nonNull()
          .field('compilation', resolve: (obj, ctx) => obj.compilation)
    ],
  );

  return __compilationEventCompilationGraphQLType;
});

/// Auto-generated from [_CompilationEventCompilation].
GraphQLObjectType<_CompilationEventCompilation>
    get compilationEventCompilationGraphQLType =>
        _compilationEventCompilationGraphQLType.value;

final _compilationEventLogGraphQLType =
    HotReloadableDefinition<GraphQLObjectType<_CompilationEventLog>>(
        (setValue) {
  final __name = 'CompilationEventLog';

  final __compilationEventLogGraphQLType = objectType<_CompilationEventLog>(
      __name,
      isInterface: false,
      interfaces: []);

  setValue(__compilationEventLogGraphQLType);
  __compilationEventLogGraphQLType.fields.addAll(
    [
      compilationLogGraphQLType
          .nonNull()
          .field('log', resolve: (obj, ctx) => obj.log)
    ],
  );

  return __compilationEventLogGraphQLType;
});

/// Auto-generated from [_CompilationEventLog].
GraphQLObjectType<_CompilationEventLog> get compilationEventLogGraphQLType =>
    _compilationEventLogGraphQLType.value;

final _compilationEventExecutionGraphQLType =
    HotReloadableDefinition<GraphQLObjectType<_CompilationEventExecution>>(
        (setValue) {
  final __name = 'CompilationEventExecution';

  final __compilationEventExecutionGraphQLType =
      objectType<_CompilationEventExecution>(__name,
          isInterface: false, interfaces: []);

  setValue(__compilationEventExecutionGraphQLType);
  __compilationEventExecutionGraphQLType.fields.addAll(
    [
      commandExecutionGraphQLType
          .nonNull()
          .field('command', resolve: (obj, ctx) => obj.command),
      graphQLInt
          .nonNull()
          .field('logIndex', resolve: (obj, ctx) => obj.logIndex)
    ],
  );

  return __compilationEventExecutionGraphQLType;
});

/// Auto-generated from [_CompilationEventExecution].
GraphQLObjectType<_CompilationEventExecution>
    get compilationEventExecutionGraphQLType =>
        _compilationEventExecutionGraphQLType.value;

final _compilationEventPartialExecutionGraphQLType = HotReloadableDefinition<
    GraphQLObjectType<_CompilationEventPartialExecution>>((setValue) {
  final __name = 'CompilationEventPartialExecution';

  final __compilationEventPartialExecutionGraphQLType =
      objectType<_CompilationEventPartialExecution>(__name,
          isInterface: false, interfaces: []);

  setValue(__compilationEventPartialExecutionGraphQLType);
  __compilationEventPartialExecutionGraphQLType.fields.addAll(
    [
      graphQLString
          .nonNull()
          .list()
          .nonNull()
          .field('stderr', resolve: (obj, ctx) => obj.stderr),
      graphQLString
          .nonNull()
          .list()
          .nonNull()
          .field('stdout', resolve: (obj, ctx) => obj.stdout)
    ],
  );

  return __compilationEventPartialExecutionGraphQLType;
});

/// Auto-generated from [_CompilationEventPartialExecution].
GraphQLObjectType<_CompilationEventPartialExecution>
    get compilationEventPartialExecutionGraphQLType =>
        _compilationEventPartialExecutionGraphQLType.value;

final _compilationEventCreationErrorGraphQLType =
    HotReloadableDefinition<GraphQLObjectType<_CompilationEventCreationError>>(
        (setValue) {
  final __name = 'CompilationEventCreationError';

  final __compilationEventCreationErrorGraphQLType =
      objectType<_CompilationEventCreationError>(__name,
          isInterface: false, interfaces: []);

  setValue(__compilationEventCreationErrorGraphQLType);
  __compilationEventCreationErrorGraphQLType.fields.addAll(
    [
      graphQLString
          .nonNull()
          .field('message', resolve: (obj, ctx) => obj.message)
    ],
  );

  return __compilationEventCreationErrorGraphQLType;
});

/// Auto-generated from [_CompilationEventCreationError].
GraphQLObjectType<_CompilationEventCreationError>
    get compilationEventCreationErrorGraphQLType =>
        _compilationEventCreationErrorGraphQLType.value;
