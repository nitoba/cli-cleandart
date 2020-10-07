import 'package:args/args.dart';
import 'package:clean_dart_cli/modules/app_module.dart';
import 'package:clean_dart_cli/modules/generate_layers/controllers/generate_layer_controller.dart';

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
  _wellcomeMessage();
  var argParser = ArgParser();
  argResults = argParser.parse(arguments);

  _addOptionsArguments(argParser);

  var isValidArguments = _validateArguments(argParser: argParser);

  if (isValidArguments) {
    appModule.generate.getIt.get<GenerateLayerController>().executeLayerCommand(
          layeCommand: argResults.arguments[2],
          path:
              argResults.arguments.length == 4 ? argResults.arguments[3] : './',
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
