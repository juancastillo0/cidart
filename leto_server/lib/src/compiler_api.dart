import 'package:leto_schema/leto_schema.dart';
import 'package:leto_server/src/compiler_service_mock.dart';
import 'package:valida/valida.dart';

import 'compilation_event.dart';
import 'compiler_models.dart';
import 'compiler_service.dart';
import 'compiler_api_models.dart';

part 'compiler_api.g.dart';

final _compilerService = ScopedRef.global((scope) => CompilerService());

class CompilerServicesStore {
  final Map<String, CompilerService> services = {};

  static final ref = ScopedRef.global((scope) => CompilerServicesStore());

  CompilerService createService(ServiceConfigInput config) {
    final s = services[config.id];
    if (s != null) {
      return s;
    }

    final now = DateTime.now();
    final service = ServiceConfig(
      serviceId: config.id,
      gitBranch: config.gitBranch,
      gitRepo: config.gitRepo,
      serverFile: config.serverFile,
      createdDate: now,
      commands: config.commands
          .map((e) => CliCommand(
                command: e.command,
                modifiedDate: now,
                name: e.name,
                variables: e.variables,
              ))
          .toList(),
    );
    final compiler = CompilerServiceMock(null, service);
    services[service.serviceId] = compiler;
    return compiler;
  }
}

@Mutation()
Future<List<CompilationLog>> startService(Ctx ctx) async {
  final service = _compilerService.get(ctx);

  return service.startService();
}

@Query()
Future<String?> topOutput(Ctx ctx) async {
  final service = _compilerService.get(ctx);

  return service.topOutput();
}

@Query()
Future<List<ServiceConfig>> services(Ctx ctx) async {
  return CompilerServicesStore.ref
      .get(ctx)
      .services
      .values
      .map((e) => e.config)
      .toList();
}

@Mutation()
Future<ServiceConfig> createService(Ctx ctx, ServiceConfigInput config) async {
  return CompilerServicesStore.ref.get(ctx).createService(config).config;
}

@Mutation()
Future<ServiceConfig?> deleteService(Ctx ctx, String serviceId) async {
  return null;
}

// TODO: [WARNING] leto_generator:graphql_resolvers on lib/src/compiler_api.dart:
// Exception: Stream<Compilation> serviceUpdates(Ctx<dynamic> ctx, String serviceId) should return a Stream to be a Subscription. #0      resolverFunctionFromElement (package:leto_generator/resolver_generator.dart:362:5)
// #1      _buildForElement (package:leto_generator/resolver_generator.dart:72:27)
// <asynchronous suspension>
@Subscription()
Stream<CompilationEvent> serviceUpdates(Ctx ctx, String serviceId) {
  final store = CompilerServicesStore.ref.get(ctx);
  final service = store.services[serviceId];
  if (service == null) {
    throw 'serviceId $serviceId not found.';
  }
  return Stream.multi((controller) {
    if (service.currentCompilation != null) {
      final compilation = Compilation.fromCurrentCompilation(
        service.currentCompilation!,
        service.config,
      );
      controller.add(CompilationEvent.currentCompilation(compilation));
    }
    controller.addStream(service.stream);
  });
}

@Subscription()
Future<Stream<CompilationEvent>> createServiceAndReceiveUpdates(
  Ctx ctx,
  ServiceConfigInput config,
) async {
  final service = CompilerServicesStore.ref.get(ctx).createService(config);

  return Stream.multi((controller) {
    controller.add(CompilationEvent.created(service.config));
    controller.addStream(service.stream);
  });
}

@Valida()
@Mutation()
Future<List<Compilation>> compilations(
  Ctx ctx,
  List<CompilationFilter>? anyOf,
) async {
  if (anyOf == null || anyOf.isEmpty) return compilationsListMock;

  return compilationsListMock
      .where(
        (compilation) => anyOf.any(
          (element) => element.hasMatch(compilation),
        ),
      )
      .toList();
}
