import 'package:args/args.dart';
import 'package:clean_dart_cli/modules/generate/generate_module.dart';
import 'package:clean_dart_cli/modules/generate/usecases/generate_complete.dart';
import 'package:clean_dart_cli/modules/generate/usecases/generate_damain.dart';
import 'package:clean_dart_cli/modules/generate/usecases/generate_external.dart';
import 'package:clean_dart_cli/modules/generate/usecases/generate_infra.dart';
import 'package:clean_dart_cli/modules/generate/usecases/generate_ui.dart';
import 'package:clean_dart_cli/shared/utils/output_utils.dart' as output;
import 'package:path/path.dart' as p;

ArgResults argResults;

enum ClassLayer { Domain, Infra, External, UI, Complete }
void main(List<String> arguments) {
  _wellcomeMessage();
  var generate = GenerateModule();
  var argParser = ArgParser();
  argResults = argParser.parse(arguments);

  _addOptionsArguments(argParser);

  var isValidArguments = _validateArguments(argParser: argParser);

  if (isValidArguments) {
    _executeLayerCommand(
      generate: generate,
      layeCommand: argResults.arguments[2],
      path: argResults.arguments.length == 4 ? argResults.arguments[3] : './',
    );
  }
}

bool _validateArguments({ArgParser argParser}) {
  var isValidArguments = argParser.options[argResults.arguments[0]].allowed
      .contains(argResults.arguments[1]);
  if (isValidArguments) {
    output.title('Valid command');
    return true;
  } else {
    output.error('Invalid command');
    return false;
  }
}

void _generateLayer({
  GenerateModule generate,
  String layer,
  String path,
  ClassLayer layerClass,
}) async {
  output.warn('generating $layer layer....');
  var pathNomalized = p.normalize('${p.current}/$path');
  var result;
  switch (layerClass) {
    case ClassLayer.Domain:
      result = await generate.getIt.get<GenerateDomain>().call(pathNomalized);
      break;
    case ClassLayer.Infra:
      result = await generate.getIt.get<GenerateInfra>().call(pathNomalized);
      break;
    case ClassLayer.External:
      result = await generate.getIt.get<GenerateExternal>().call(pathNomalized);
      break;
    case ClassLayer.UI:
      result = await generate.getIt.get<GenerateUI>().call(pathNomalized);
      break;
    case ClassLayer.Complete:
      result = await generate.getIt.get<GenerateComplete>().call(pathNomalized);
      break;
    default:
  }
  if (result) {
    output.title('${layer.toUpperCase()} layer created');
    return;
  }
  output.error('Directory not exists');
}

Future<void> _executeLayerCommand({
  GenerateModule generate,
  String layeCommand,
  String path,
}) async {
  switch (layeCommand) {
    case 'domain':
      _generateLayer(
        generate: generate,
        layer: layeCommand,
        path: path,
        layerClass: ClassLayer.Domain,
      );
      break;
    case 'infra':
      _generateLayer(
        generate: generate,
        layer: layeCommand,
        path: path,
        layerClass: ClassLayer.Infra,
      );
      break;
    case 'external':
      _generateLayer(
        generate: generate,
        layer: layeCommand,
        path: path,
        layerClass: ClassLayer.External,
      );
      break;
    case 'ui':
      _generateLayer(
        generate: generate,
        layer: layeCommand,
        path: path,
        layerClass: ClassLayer.UI,
      );
      break;
    case 'complete':
      _generateLayer(
        generate: generate,
        layer: layeCommand,
        path: path,
        layerClass: ClassLayer.Complete,
      );
      break;
    default:
  }
}

void _addOptionsArguments(ArgParser argParser) {
  argParser.addOption(
    'gen',
    abbr: 'g',
    allowed: ['layer', 'usecase', 'datasource', 'repository'],
  );
}

void _wellcomeMessage() {
  output.title('################### Clean Dart CLI ###################');
}
