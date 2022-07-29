import 'package:leto_schema/leto_schema.dart';

import 'compiler_models.dart';
import 'compiler_service.dart';

part 'compiler_api.g.dart';

final _compilerService = RefWithDefault.global((scope) => CompilerService());

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
