// ignore: depend_on_referenced_packages
import 'package:leto_schema/leto_schema.dart';
import 'package:leto_server/src/compiler_api.dart';
import 'package:leto_server/src/compilation_event.dart';
import 'package:leto_server/src/compiler_api_models.dart';
import 'package:leto_server/src/filters.dart';
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
          serviceConfigInputSerializer,
          cliCommandInputSerializer,
          compilationFilterSerializer,
          serviceConfigFilterSerializer,
          dateTimeFilterSerializer,
          stringFilterSerializer,
          cliCommandVariableSerializer,
          cliCommandSerializer,
          serviceConfigSerializer,
        ])
        ..children.addAll([
          compFilterSerdeCtx,
        ]),
      queryType: objectType(
        'Query',
        fields: [
          topOutputGraphQLField,
          servicesGraphQLField,
          validateServiceConfigGraphQLField,
          compilationsGraphQLField,
        ],
      ),
      mutationType: objectType(
        'Mutation',
        fields: [
          startServiceGraphQLField,
          createServiceGraphQLField,
          deleteServiceGraphQLField,
        ],
      ),
      subscriptionType: objectType(
        'Subscription',
        fields: [
          serviceUpdatesGraphQLField,
          createServiceAndReceiveUpdatesGraphQLField,
        ],
      ),
    );
