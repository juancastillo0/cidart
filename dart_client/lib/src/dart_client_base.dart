import 'dart:async';
import 'package:dart_client/schema.graphql.dart';
import 'package:dart_client/src/api.graphql.dart';
import 'package:graphql/client.dart';
import 'package:mobx/mobx.dart';

export 'package:dart_client/schema.graphql.dart';
export 'package:dart_client/src/api.graphql.dart';
export 'package:graphql/client.dart';

class ServiceAndCompilations {
  final Fragment$ServiceConfigF service;
  final StreamSubscription subscription;

  final ObservableMap<String, Fragment$CompilationF> compilations =
      ObservableMap(name: 'compilations');
  final Observable<String?> latestCommitHash =
      Observable(null, name: 'latestCommitHash');

  late final latestCompilation = Computed(
    () => latestCommitHash.value == null
        ? null
        : compilations.get(latestCommitHash.value!),
  );

  ServiceAndCompilations(this.subscription, this.service);

  void setCompilation(Fragment$CompilationF compilation) {
    runInAction(() {
      assert(compilation.serviceConfig.serviceId == service.serviceId);
      final modified =
          compilation.copyWith(logs: ObservableList.of(compilation.logs));
      compilations[modified.commitHash] = modified;
      latestCommitHash.value = modified.commitHash;
    });
  }
}

extension GetSetMap<K, V> on Map<K, V> {
  V? get(K key) => this[key];
  V? set(K key, V value) {
    final previous = this[key];
    this[key] = value;
    return previous;
  }
}

class CompilerClient {
  final GraphQLClient client;

  /// ```dart
  /// GraphQLClient(
  ///   link: WebSocketLink(
  ///     'ws://localhost:8060/graphql-subscription',
  ///     config: SocketClientConfig(),
  ///     subProtocol: GraphQLProtocol.graphqlTransportWs,
  ///   ),
  ///   cache: GraphQLCache(
  ///     possibleTypesMap
  ///   ),
  ///  );
  /// }
  /// ```
  CompilerClient(this.client);

  final StreamController<OperationException> _exceptionsController =
      StreamController.broadcast();
  Stream<OperationException> get exceptionsStream =>
      _exceptionsController.stream;

  final ObservableMap<String, ServiceAndCompilations> services =
      ObservableMap(name: 'services');

  Future<
          Result<ServiceAndCompilations,
              Fragment$CompilationEventF$$CompilationEventCreationError>>
      createAndSubscribe(Input$ServiceConfigInput config) {
    final completer = Completer<
        Result<ServiceAndCompilations,
            Fragment$CompilationEventF$$CompilationEventCreationError>>();
    final stream = client.subscribe$createServiceAndReceiveUpdates(
      Options$Subscription$createServiceAndReceiveUpdates(
        variables: Variables$Subscription$createServiceAndReceiveUpdates(
          serviceConfig: config,
        ),
      ),
    );
    ServiceAndCompilations? serviceAndCompilations;
    late final StreamSubscription subscription;
    subscription = stream.listen((event) {
      final data = event.parsedData?.createServiceAndReceiveUpdates;
      if (data != null) {
        data.when(
          created: (c) {
            ServiceAndCompilations? value = services[c.service.serviceId];
            if (value != null) {
              subscription.cancel();
            } else {
              value = ServiceAndCompilations(subscription, c.service);
              services[c.service.serviceId] = value;
            }
            serviceAndCompilations = value;
            completer.complete(Ok(value));
          },
          creationError: (e) {
            completer.complete(Err(e));
          },
          orElse: (e) => _handleEvent(serviceAndCompilations!, e),
        );
      } else {
        final exception = event.exception;
        if (exception != null) {
          subscription.cancel();
          _exceptionsController.add(exception);
          if (!completer.isCompleted) {
            completer.completeError(exception);
          }
        }
      }
    });

    return completer.future;
  }

  void _handleEvent(
    ServiceAndCompilations service,
    Fragment$CompilationEventF event,
  ) {
    event.when(
      compilation: (c) {
        service.setCompilation(c.compilation);
      },
      log: (e) {
        service.latestCompilation.value!.logs.add(e.log);
      },
      execution: (e) {
        final compilation = service.latestCompilation.value!;
        final value = compilation.logs[e.logIndex];
        compilation.logs[e.logIndex] = value.copyWith(command: e.command);
      },
      partialExecution: (e) {
        // TODO:
        // final compilation = service.latestCompilation.value!;
        // final value = compilation.logs[e.logIndex];
        // compilation.logs[e.logIndex] = value.copyWith(command: e.command);
      },
    );
  }

  Future<Result<List<Fragment$CompilationLogF>, OperationException>>
      startService() {
    return client
        .mutate$startService(Options$Mutation$startService())
        ._wrapResult((e) => e.startService);
  }

  Future<Result<String?, OperationException>> topResult() {
    return client
        .query$topResult(Options$Query$topResult())
        ._wrapResult((e) => e.topOutput);
  }
}

// ignore: constant_identifier_names
const Ok = Result.ok;
// ignore: constant_identifier_names
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

extension WhenFragment$CompilationEventF on Fragment$CompilationEventF {
  T? when<T>({
    T Function(Fragment$CompilationEventF$$CompilationEventCompilation)?
        compilation,
    T Function(Fragment$CompilationEventF$$CompilationEventCreated)? created,
    T Function(Fragment$CompilationEventF$$CompilationEventCreationError)?
        creationError,
    T Function(Fragment$CompilationEventF$$CompilationEventExecution)?
        execution,
    T Function(Fragment$CompilationEventF$$CompilationEventPartialExecution)?
        partialExecution,
    T Function(Fragment$CompilationEventF$$CompilationEventLog)? log,
    T Function(Fragment$CompilationEventF)? orElse,
  }) {
    final v = this;
    if (v is Fragment$CompilationEventF$$CompilationEventCompilation &&
        compilation != null) {
      return compilation(v);
    } else if (v is Fragment$CompilationEventF$$CompilationEventCreated &&
        created != null) {
      return created(v);
    } else if (v is Fragment$CompilationEventF$$CompilationEventCreationError &&
        creationError != null) {
      return creationError(v);
    } else if (v is Fragment$CompilationEventF$$CompilationEventExecution &&
        execution != null) {
      return execution(v);
    } else if (v
            is Fragment$CompilationEventF$$CompilationEventPartialExecution &&
        partialExecution != null) {
      return partialExecution(v);
    } else if (v is Fragment$CompilationEventF$$CompilationEventLog &&
        log != null) {
      return log(v);
    }
    return orElse?.call(v);
  }
}

extension WrapResult<R extends Object> on Future<QueryResult<R>> {
  Future<Result<T, OperationException>> _wrapResult<T>(
    T Function(R) success,
  ) async {
    final result = await this;
    if (result.hasException) {
      return Result.err(result.exception!);
    }

    return Result.ok(success(result.parsedData!));
  }
}
