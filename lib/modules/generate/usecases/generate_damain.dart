import 'dart:io';

import '../../../shared/interfaces/igenerate.dart';

class GenerateDomain implements IGenerate {
  @override
  Future<void> call(String path) async {
    var pathValid = path.replaceAll('//', '/');
    var dir = await Directory('$pathValid/domain').create();
    await Directory('${dir.path}/entities').create();
    await Directory('${dir.path}/usecases').create();
    await Directory('${dir.path}/repositories').create();
  }
}
