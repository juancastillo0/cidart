import 'dart:io' show HttpServer;
import 'dart:math';

import 'package:gql/language.dart' as gql;
import 'package:leto/leto.dart';
import 'package:leto_server/src/util.dart';
import 'package:test/test.dart';
import 'package:dart_client/dart_client.dart';

import '../bin/server.dart';

main() {
  const adminSecret = 'admin-secret-22';
  late HttpServer server;

  setUp(() async {
    server = await createServer(
      adminSecret: adminSecret,
      globalVariables: ScopedMap(
        overrides: [
          randomRef.override((scope) => Random(42)),
        ],
      ),
    );
  });

  tearDown(() => server.close());

  test('client', () async {
    final link = WebSocketLink(
      'ws://${server.address.address}:${server.port}/graphql-subscription',
      subProtocol: GraphQLProtocol.graphqlTransportWs,
    );

    final top = await link
        .request(
          Request(
            operation: Operation(document: gql.parseString('{topOutput}')),
          ),
        )
        .first;

    print('topOutput ${top.data}');

    final client = GraphQLClient(
      link: link,
      cache: GraphQLCache(possibleTypes: possibleTypesMap),
    );

    final stream = client.subscribe$createServiceAndReceiveUpdates(
      Options$Subscription$createServiceAndReceiveUpdates(
        variables: Variables$Subscription$createServiceAndReceiveUpdates(
          serviceConfig: Input$ServiceConfigInput(
            gitRepo: 'https://github.com/juancastillo0/room_signals',
            // TODO: head should not be needed
            gitBranch: 'head/main',
            serverFile: 'bin/server',
            commands: [
              Input$CliCommandInput(
                command: ['dart', 'test'],
                name: 'dawd',
                variables: [],
              ),
            ],
          ),
        ),
      ),
    );
    int i = 0;
    final expected = [];

    stream.listen((expectAsync1(
      (event) {
        // expect(
        //   event.parsedData?.createServiceAndReceiveUpdates.toJson(),
        //   expected[i++],
        // );
        print(
            'i:${i++} ${event.parsedData?.createServiceAndReceiveUpdates.toJson()}');
      },
      count: 4,
    )));
    final topResult = await client.query$topResult();

    expect(topResult.parsedData, isNotNull);
    expect(topResult.parsedData?.topOutput, null);
  });

  test('parsing error', () async {
    final link = WebSocketLink(
      'ws://${server.address.address}:${server.port}/graphql-subscription',
      subProtocol: GraphQLProtocol.graphqlTransportWs,
      config: SocketClientConfig(
        headers: {'authorization': adminSecret},
      ),
    );

    SubscriptionError? error;
    try {
      final top = await link
          .request(
            Request(
              operation: Operation(
                document: gql.parseString('{wrongQuery}'),
              ),
            ),
          )
          .first;
      print('topOutput ${top.data}');
    } catch (e) {
      error = e as SubscriptionError;
    }

    expect(error?.payload, [
      {
        'message': 'Cannot query field "wrongQuery" on type "Query".',
        'locations': [
          {'line': 1, 'column': 2}
        ],
        'extensions': {
          'validationError': {
            'spec': 'https://spec.graphql.org/draft/#sec-Field-Selections',
            'code': 'fieldsOnCorrectType'
          }
        }
      }
    ]);
  });
}
