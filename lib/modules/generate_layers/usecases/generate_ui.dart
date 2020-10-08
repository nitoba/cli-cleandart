import 'dart:io';

import '../../../shared/interfaces/igenerate_layers.dart';

class GenerateUI implements IGenerateLayers {
  @override
  Future<bool> call(String path) async {
    var isValidDirectory = await Directory(path).exists();
    if (isValidDirectory) {
      var dir = await Directory('$path/ui').create();
      await Directory('${dir.path}/controllers').create();
      await Directory('${dir.path}/pages').create();
      await Directory('${dir.path}/components').create();
      return true;
    } else {
      return false;
    }
  }
}
