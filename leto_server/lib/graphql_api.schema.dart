// ignore: depend_on_referenced_packages
import 'package:leto_schema/leto_schema.dart';
import 'package:leto_server/src/compiler_api.dart';
import 'package:leto_server/src/compiler_models.dart';

GraphQLSchema recreateGraphQLApiSchema() {
  HotReloadableDefinition.incrementCounter();
  _graphqlApiSchema = null;
  return graphqlApiSchema;
}

GraphQLSchema? _graphqlApiSchema;
GraphQLSchema get graphqlApiSchema => _graphqlApiSchema ??= GraphQLSchema(
      serdeCtx: SerdeCtx()
        ..addAll([
          compilerLogSerializer,
        ])
        ..children.addAll([]),
      queryType: objectType(
        'Query',
        fields: [
          topOutputGraphQLField,
        ],
      ),
      mutationType: objectType(
        'Mutation',
        fields: [
          startServiceGraphQLField,
        ],
      ),
    );
