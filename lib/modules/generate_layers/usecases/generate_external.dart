import 'dart:io';

import '../../../shared/interfaces/igenerate.dart';

class GenerateExternal implements IGenerate {
  @override
  Future<bool> call(String path) async {
    var isValidDirectory = await Directory(path).exists();
    if (isValidDirectory) {
      var dir = await Directory('$path/external').create();
      await Directory('${dir.path}/datasource').create();
      return true;
    } else {
      return false;
    }
  }
}
