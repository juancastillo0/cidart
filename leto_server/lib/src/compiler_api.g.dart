// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compiler_api.dart';

// **************************************************************************
// _GraphQLGenerator
// **************************************************************************

GraphQLObjectField<List<CompilerLog>, Object?, Object?>
    get startServiceGraphQLField => _startServiceGraphQLField.value;
final _startServiceGraphQLField = HotReloadableDefinition<
        GraphQLObjectField<List<CompilerLog>, Object?, Object?>>(
    (setValue) => setValue(
            compilerLogGraphQLType.nonNull().list().nonNull().field<Object?>(
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
