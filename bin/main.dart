import 'package:args/args.dart';
import 'package:clean_dart_cli/modules/app_module.dart';
import 'package:clean_dart_cli/modules/generate_layers/controllers/generate_layer_controller.dart';
import 'package:clean_dart_cli/modules/generate_layers/controllers/generate_usecase_controller.dart';

import 'package:clean_dart_cli/modules/generate_layers/generate_module.dart';
import 'package:clean_dart_cli/modules/generate_layers/usecases/generate_complete.dart';
import 'package:clean_dart_cli/modules/generate_layers/usecases/generate_damain.dart';
import 'package:clean_dart_cli/modules/generate_layers/usecases/generate_external.dart';
import 'package:clean_dart_cli/modules/generate_layers/usecases/generate_infra.dart';
import 'package:clean_dart_cli/modules/generate_layers/usecases/generate_ui.dart';
import 'package:clean_dart_cli/shared/utils/output_utils.dart' as output;
import 'package:path/path.dart' as p;

ArgResults argResults;

enum ClassLayer { Domain, Infra, External, UI, Complete }
void main(List<String> arguments) {
  var appModule = AppModule();
  var generateLayerController =
      appModule.generate.getIt<GenerateLayerController>();
  var generateUsecaseController =
      appModule.generate.getIt<GenerateUsecaseController>();
  _wellcomeMessage();
  var argParser = ArgParser();
  argResults = argParser.parse(arguments);

  _addOptionsArguments(argParser);

  var isValidArguments = _validateArguments(argParser: argParser);

  if (isValidArguments != null) {
    switch (isValidArguments) {
      case 'layer':
        generateLayerController.generateLayerFolders(
          layeCommand: argResults.arguments[2],
          path:
              argResults.arguments.length == 4 ? argResults.arguments[3] : './',
        );
        break;
      case 'usecase':
        generateUsecaseController.genereteUsecase();
        break;
      default:
    }
  }
}

String _validateArguments({ArgParser argParser}) {
  var isValidArguments = argParser.options[argResults.arguments[0]].allowed
      .contains(argResults.arguments[1]);
  if (isValidArguments) {
    output.title('Valid command');
    return argResults.arguments[1];
  } else {
    output.error('Invalid command, try with --help or -h');
    return null;
  }
}

void _addOptionsArguments(ArgParser argParser) {
  argParser.addOption(
    'gen',
    abbr: 'g',
    allowed: ['layer', 'usecase', 'datasource', 'repository', 'model'],
  );

  argParser.addFlag(
    'help',
    abbr: 'h',
  );
}

void _wellcomeMessage() {
  output.title('################### Clean Dart CLI ###################');
}
