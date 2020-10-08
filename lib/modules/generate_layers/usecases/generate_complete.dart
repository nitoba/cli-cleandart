import 'dart:io';

import '../../../shared/interfaces/igenerate.dart';

class GenerateComplete implements IGenerateLayers {
  final IGenerateLayers _gnDomain;
  final IGenerateLayers _gnInfra;
  final IGenerateLayers _gnExternal;
  final IGenerateLayers _gnUI;

  GenerateComplete(this._gnDomain, this._gnInfra, this._gnExternal, this._gnUI);

  @override
  Future<bool> call(String path) async {
    var isValidDirectory = await Directory(path).exists();
    if (isValidDirectory) {
      await _gnDomain(path);
      await _gnExternal(path);
      await _gnInfra(path);
      await _gnUI(path);
      return true;
    } else {
      return false;
    }
  }
}
