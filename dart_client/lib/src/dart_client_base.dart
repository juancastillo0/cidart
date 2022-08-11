import 'dart:async';
import 'package:dart_client/src/api.graphql.dart';
import 'package:graphql/client.dart';

class CompilerClient {
  final GraphQLClient client;

  /// GraphQLClient(
  ///     link: WebSocketLink(
  ///       'ws://localhost:8060/graphql-subscription',
  ///       config: SocketClientConfig(),
  ///       subProtocol: GraphQLProtocol.graphqlTransportWs,
  ///     ),
  ///     cache: GraphQLCache(
  ///        possibleTypesMap
  ///      ),
  ///   );
  /// }
  CompilerClient(this.client);

  Future<Result<List<Fragment$CompilationLogF>, OperationException>>
      startService() async {
    final result = await client.mutate$startService(
      Options$Mutation$startService(),
    );
    if (result.hasException) {
      return Result.err(result.exception!);
    }

    return Result.ok(result.parsedData!.startService);
  }

  Future<Result<String?, OperationException>> topResult() async {
    final result = await client.query$topResult(
      Options$Query$topResult(),
    );
    if (result.hasException) {
      return Result.err(result.exception!);
    }

    return Result.ok(result.parsedData!.topOutput);
  }
}

const Ok = Result.ok;
const Err = Result.err;

class Result<T, E> {
  final T? ok;
  final E? err;
  final bool isOk;

  bool get isErr => !isOk;

  Result.ok(T this.ok)
      : isOk = true,
        err = null;
  Result.err(E this.err)
      : isOk = false,
        ok = null;

  O when<O>({
    required O Function(T ok) ok,
    required O Function(E err) err,
  }) =>
      isOk ? ok(this.ok as T) : err(this.err as E);
}
