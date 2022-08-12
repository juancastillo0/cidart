import 'dart:convert' show jsonEncode;
import 'dart:io';

import 'package:leto/leto.dart';
import 'package:leto_schema/validate.dart';
import 'package:leto_schema/validate_rules.dart';
import 'package:leto_server/compiler.dart';
import 'package:leto_server/graphql_api.schema.dart';
import 'package:leto_shelf/leto_shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_hotreload/shelf_hotreload.dart';
import 'package:gql/language.dart' as gql;

void main(List<String> arguments) async {
  final verifyClient = arguments.any((arg) => arg == '--verify-client');
  if (verifyClient) {
    final queries = await readClientGraphQLFiles(verify: true, edit: false);
    print('Found ${queries.length} GraphQL queries in the client.');
  } else {
    withHotreload(() {
      return createServer();
    });
  }
}

Future<HttpServer> createServer({
  ScopedMap? globalVariables,
}) async {
  recreateGraphQLApiSchema();
  final clientQueries = await readClientGraphQLFiles();
  final service = CompilerService();
  final router = makeCompilerRouter(
    service,
    clientQueries,
    globalVariables: globalVariables,
  );
  final server = startCompilerServer(router);

  return server;
}

Future<List<DocumentNode>> readClientGraphQLFiles({
  bool edit = true,
  bool verify = false,
}) async {
  final paths = Directory.current.uri.pathSegments;
  final clientDirPath = ['']
      .followedBy(paths.take(paths.length - 2))
      .followedBy(['dart_client', 'lib']).join(Platform.pathSeparator);

  final schemaFile = File(
    '$clientDirPath${Platform.pathSeparator}schema.graphql',
  );
  final List<String> errors = [];
  final exists = await schemaFile.exists();
  final foundSchema = exists ? await schemaFile.readAsString() : null;
  if (!exists || foundSchema != graphqlApiSchema.schemaStr) {
    if (verify) {
      errors.add(
        exists
            ? 'FOUND_GRAPHQL_SCHEMA\n$foundSchema'
                '\nEXPECTED_GRAPHQL_SCHEMA\n${graphqlApiSchema.schemaStr}'
            : 'GRAPHQL_SCHEMA_FILE_NOT_FOUND: ${schemaFile.path}',
      );
    }
    if (edit) {
      if (!exists) {
        await schemaFile.create();
      }
      await schemaFile.writeAsString(graphqlApiSchema.schemaStr);
    }
  }

  final values = await Directory(clientDirPath)
      .list(recursive: true, followLinks: false)
      .where((event) =>
          event is File &&
          event.path != schemaFile.path &&
          event.path.endsWith('.graphql'))
      .cast<File>()
      .asyncMap((event) async => MapEntry(event, await event.readAsString()))
      .map((event) {
        try {
          return gql.parseString(event.value);
        } catch (e, s) {
          if (verify) {
            errors.add('DOCUMENT_PARSING_ERROR: ${event.key.path}\n$e\n$s');
          }
          return null;
        }
      })
      .where((event) => event != null)
      .cast<DocumentNode>()
      .toList();

  final allValidationRules = [...specifiedRules, complexityRule()];
  for (final document in values) {
    final validationErrors = validateDocument(
      graphqlApiSchema,
      document,
      rules: allValidationRules,
    );
    if (validationErrors.isNotEmpty) {
      if (verify) {
        errors.addAll(validationErrors.map((e) => e.toString()));
      } else {
        print(validationErrors);
      }
    }
  }
  if (verify && errors.isNotEmpty) {
    throw errors.join('\n\n');
  }
  return values;
}

ValidationRule complexityRule() =>
    queryComplexityRuleBuilder(maxComplexity: 1000, maxDepth: 7);

Router makeCompilerRouter(
  CompilerService service,
  List<DocumentNode> clientQueries, {
  ScopedMap? globalVariables,
}) {
  final computeHash = GraphQLPersistedQueries.defaultComputeHash;

  final executor = GraphQL(
    graphqlApiSchema,
    customValidationRules: [complexityRule()],
    globalVariables: globalVariables,
    extensions: [
      if (Platform.environment['GRAPHQL_TRACING'] == 'true')
        GraphQLTracingExtension(
          returnInResponse: true,
        ),
      GraphQLPersistedQueries(
        returnHashInResponse: true,
        cache: LruCacheSimple.fromMap(
          100,
          Map.fromIterables(
            clientQueries.map(gql.printNode).map(computeHash),
            clientQueries,
          ),
        ),
        computeHash: computeHash,
      ),
      CacheExtension(cache: LruCacheSimple(50)),
      LoggingExtension((log) {
        // TODO: don't print whole queries
        if (log.operationName != 'IntrospectionQuery') {
          print(log);
        }
      }),
    ],
  );

  // Configure routes.
  final router = Router()
    ..get(
      '/',
      (Request request) {
        return Response.ok(
          _rootHtml,
          headers: {'content-type': 'text/html'},
        );
      },
    )
    // ..post(
    //   '/compile',
    //   (Request request) {},
    // )
    ..all('/graphql', graphQLHttp(executor))
    ..all('/graphql-subscription', graphQLWebSocket(executor))
    ..get(
      '/compile',
      (Request request) async {
        List<CompilationLog> result;
        Object? error;
        try {
          result = await service.startService();
          // } on StateError catch (e) {
          //   result = service.compilationLogs;
        } catch (e) {
          error = e;
          result = service.currentCompilation?.compilationLogs ?? [];
        }

        final body = {
          'currentCompilation': {
            'errorCode': error == null
                ? null
                : error is StateError
                    ? error.message
                    : 'execution',
            'errorString': error is! StateError ? error?.toString() : null,
            'logs': result,
          },
          'deployed': service.currentService == null
              ? null
              : {
                  'commitId': service.currentService!.commitHash,
                  'topOutput': await service.topOutput(),
                  'logs': service.logs[service.currentService!.commitHash],
                },
          'allCompilations': service.logs,
        };

        return Response.ok(
          jsonEncode(body),
          headers: {'content-type': 'application/json'},
        );
      },
    );
  return router;
}

Future<HttpServer> startCompilerServer(Router router) async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;
  final server = await HttpServer.bind(ip, 8060);
  final adminPassword = Platform.environment['COMPILER_ADMIN_PASSWORD'];

  // Configure a pipeline that logs requests.
  final handler = Pipeline()
      .addMiddleware((innerHandler) {
        return (request) {
          final authHeader = request.headers[HttpHeaders.authorizationHeader];
          if (request.url.path.isNotEmpty &&
              (authHeader == null || authHeader != adminPassword)) {
            return Response(HttpStatus.unauthorized);
          }
          return innerHandler(request);
        };
      })
      .addMiddleware(customLog())
      .addMiddleware(etag())
      .addMiddleware(jsonParse())
      .addHandler(router);

  serveRequests(server, handler);
  print(
    'Compiler server listening at "http://localhost:${server.port}"',
  );
  return server;
}

const _rootHtml = '''
<html>
<head></head>
<body>

<div style="display:flex;flex-direction:column;height:100%;width:100%;">
  <div style="display:flex;flex-direction:row;height:25px;justify-content:center;">
  <label for="authInput" style="padding:3px 3px 0 0;">Authorization</label>
  <input id="authInput" type="password">
  </input>
  <button id="refreshButton">Refresh</button>
  <select id="selectFromAll">Refresh</select>
  </div>

  <h2>Output</h2>
  <div id="loadingMessage"></div>
  <pre id="mainOutput" style="flex:1;white-space:pre-wrap;overflow:auto;margin-top:0;">
    Empty, set the authorization and click "Refresh".
  </pre>
</div>


<script>
const removeChildren = (e) => {
  let child = e.lastElementChild; 
  while (child) {
      e.removeChild(child);
      child = e.lastElementChild;
  }
}

const elemById = (id) => document.getElementById(id);
const refreshButton = elemById("refreshButton");
const mainOutput = elemById("mainOutput");
const authInput = elemById("authInput");
const loadingMessage = elemById("loadingMessage");
const selectFromAll = elemById("selectFromAll");
let allCompilations;
let authHeader;
let loading = false;

const onClick = async () => {
  if (loading) return;
  if (authInput.value) {
    authHeader = authInput.value;
    authInput.value = '';
  }
  loading = true;
  loadingMessage.textContent = "Loading...";

  let content;
  try {
    const response = await fetch('/compile', {
      method: 'GET',
      headers: {
        'Authorization': authHeader,
      },
    });
    if (response.ok) {
      const responseJson = await response.json();
      if (responseJson.allCompilations) {
        allCompilations = responseJson.allCompilations;
      }
      
      removeChildren(selectFromAll);
      for (const k of Object.keys(allCompilations)) {
        const op = document.createElement('option');
        op.value = k;
        selectFromAll.appendChild(op);
      }

      content = JSON.stringify(responseJson, null, 2);
    } else {
      const responseText = await response.text();
      content = ''+ response.status +' '+ response.statusText +'. '+ responseText
    }
  } catch (e) {
    content = String(e);
  }

  mainOutput.textContent = content;
  loadingMessage.textContent = '';
  loading = false;
};


refreshButton.addEventListener('click', () => onClick());
selectFromAll.addEventListener('input', () => onClick());

</script>
</body>
</html>''';
