import '../../../shared/interfaces/igenerate.dart';

class GenerateComplete implements IGenerate {
  final IGenerate _gnDomain;
  final IGenerate _gnInfra;
  final IGenerate _gnExternal;
  final IGenerate _gnUI;

  GenerateComplete(this._gnDomain, this._gnInfra, this._gnExternal, this._gnUI);

  @override
  Future<void> call(String path) async {
    await _gnDomain(path);
    await _gnExternal(path);
    await _gnInfra(path);
    await _gnUI(path);
  }
}
