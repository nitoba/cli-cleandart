import 'dart:io';

import '../../../shared/interfaces/igenerate.dart';

class GenerateInfra implements IGenerate {
  @override
  Future<void> call(String path) async {
    var pathValid = path.replaceAll('//', '/');
    var dir = await Directory('$pathValid/infra').create();
    await Directory('${dir.path}/repositories').create();
    await Directory('${dir.path}/datasource').create();
    await Directory('${dir.path}/models').create();
  }
}
