import 'dart:io';

import '../../../shared/interfaces/igenerate.dart';

class GenerateUI implements IGenerate {
  @override
  Future<void> call(String path) async {
    var pathValid = path.replaceAll('//', '/');
    var dir = await Directory('$pathValid/ui').create();
    await Directory('${dir.path}/controllers').create();
    await Directory('${dir.path}/pages').create();
    await Directory('${dir.path}/components').create();
  }
}
