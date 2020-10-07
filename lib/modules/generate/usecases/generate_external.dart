import 'dart:io';

import '../../../shared/interfaces/igenerate.dart';

class GenerateExternal implements IGenerate {
  @override
  Future<void> call(String path) async {
    var pathValid = path.replaceAll('//', '/');
    var dir = await Directory('$pathValid/external').create();
    await Directory('${dir.path}/datasource').create();
  }
}
