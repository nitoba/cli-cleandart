import 'dart:io';

import '../../../shared/interfaces/igenerate.dart';

class GenerateInfra implements IGenerate {
  @override
  Future<bool> call(String path) async {
    var isValidDirectory = await Directory(path).exists();
    if (isValidDirectory) {
      var dir = await Directory('$path/infra').create();
      await Directory('${dir.path}/repositories').create();
      await Directory('${dir.path}/datasource').create();
      await Directory('${dir.path}/models').create();
      return true;
    } else {
      return false;
    }
  }
}
