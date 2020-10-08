import 'package:clean_dart_cli/shared/interfaces/igenerate_layers.dart';
import 'package:get_it/get_it.dart';
import 'package:path/path.dart' as p;
import 'package:clean_dart_cli/shared/utils/output_utils.dart' as output;

enum ClassLayer { Domain, Infra, External, UI, Complete }

class GenerateLayerController {
  final getIt = GetIt.instance;
  final IGenerateLayers _domain;
  final IGenerateLayers _infra;
  final IGenerateLayers _external;
  final IGenerateLayers _ui;
  final IGenerateLayers _complete;

  GenerateLayerController(
    this._domain,
    this._infra,
    this._external,
    this._ui,
    this._complete,
  );

  void _generateLayer({
    String layer,
    String path,
    ClassLayer layerClass,
  }) async {
    output.warn('generating $layer layer....');
    var pathNomalized = p.normalize('${p.current}/$path');
    var result;
    switch (layerClass) {
      case ClassLayer.Domain:
        result = await _domain.call(pathNomalized);
        break;
      case ClassLayer.Infra:
        result = await _infra.call(pathNomalized);
        break;
      case ClassLayer.External:
        result = await _external.call(pathNomalized);
        break;
      case ClassLayer.UI:
        result = await _ui.call(pathNomalized);
        break;
      case ClassLayer.Complete:
        result = await _complete.call(pathNomalized);
        break;
      default:
    }
    if (result) {
      output.title('${layer.toUpperCase()} layer created');
      return;
    }
    output.error('Directory not exists');
  }

  Future<void> generateLayerFolders({
    String layeCommand,
    String path,
  }) async {
    switch (layeCommand) {
      case 'domain':
        _generateLayer(
          layer: layeCommand,
          path: path,
          layerClass: ClassLayer.Domain,
        );
        break;
      case 'infra':
        _generateLayer(
          layer: layeCommand,
          path: path,
          layerClass: ClassLayer.Infra,
        );
        break;
      case 'external':
        _generateLayer(
          layer: layeCommand,
          path: path,
          layerClass: ClassLayer.External,
        );
        break;
      case 'ui':
        _generateLayer(
          layer: layeCommand,
          path: path,
          layerClass: ClassLayer.UI,
        );
        break;
      case 'complete':
        _generateLayer(
          layer: layeCommand,
          path: path,
          layerClass: ClassLayer.Complete,
        );
        break;
      default:
        output.error('This Layer not exists');
    }
  }
}
