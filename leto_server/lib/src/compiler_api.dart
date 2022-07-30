import 'package:leto_schema/leto_schema.dart';
import 'package:valida/valida.dart';

import 'compiler_models.dart';
import 'compiler_service.dart';
import 'compiler_api_models.dart';
import 'util.dart';

part 'compiler_api.g.dart';

final _compilerService = RefWithDefault.global((scope) => CompilerService());

class CompilerServicesStore {
  final Map<String, CompilerService> services = {};
}

@Mutation()
Future<List<CompilerLog>> startService(Ctx ctx) async {
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
  return [];
}

@Mutation()
Future<ServiceConfig> createService(Ctx ctx, ServiceConfigInput config) async {
  final now = DateTime.now();

  return ServiceConfig(
    serviceId: randomId(),
    gitBranch: config.gitBranch,
    gitRepo: config.gitRepo,
    serverFile: config.serverFile,
    commands: config.commands
        .map((e) => CliCommand(
              command: e.command,
              modifiedDate: now,
              name: e.name,
              variables: e.variables,
            ))
        .toList(),
  );
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
Stream<Compilation> serviceUpdates(Ctx ctx, String serviceId) {
  return Stream.fromIterable(compilationsListMock);
}

@Valida()
@Mutation()
Future<List<Compilation>> compilations(
  Ctx ctx,
  // TODO: should the annotation be necessary?
  @ValidaList(
    each: ValidaNested(
      overrideValidation: CompilationFilterValidation.fromValue,
    ),
  )
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
