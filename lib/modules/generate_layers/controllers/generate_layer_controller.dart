import 'package:clean_dart_cli/modules/generate_layers/usecases/generate_complete.dart';
import 'package:clean_dart_cli/modules/generate_layers/usecases/generate_damain.dart';
import 'package:clean_dart_cli/modules/generate_layers/usecases/generate_external.dart';
import 'package:clean_dart_cli/modules/generate_layers/usecases/generate_infra.dart';
import 'package:clean_dart_cli/modules/generate_layers/usecases/generate_ui.dart';
import 'package:get_it/get_it.dart';
import 'package:path/path.dart' as p;
import 'package:clean_dart_cli/shared/utils/output_utils.dart' as output;

enum ClassLayer { Domain, Infra, External, UI, Complete }

class GenerateLayerController {
  final getIt = GetIt.instance;
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
        result = await getIt.get<GenerateDomain>().call(pathNomalized);
        break;
      case ClassLayer.Infra:
        result = await getIt.get<GenerateInfra>().call(pathNomalized);
        break;
      case ClassLayer.External:
        result = await getIt.get<GenerateExternal>().call(pathNomalized);
        break;
      case ClassLayer.UI:
        result = await getIt.get<GenerateUI>().call(pathNomalized);
        break;
      case ClassLayer.Complete:
        result = await getIt.get<GenerateComplete>().call(pathNomalized);
        break;
      default:
    }
    if (result) {
      output.title('${layer.toUpperCase()} layer created');
      return;
    }
    output.error('Directory not exists');
  }

  Future<void> executeLayerCommand({
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
    }
  }
}
