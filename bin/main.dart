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
      path: argResults.arguments[3],
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

void _executeLayerCommand(
    {GenerateModule generate, String layeCommand, String path}) {
  switch (layeCommand) {
    case 'domain':
      output.title('generating layer domain...');
      generate.getIt.get<GenerateDomain>().call('${p.current}/$path');
      break;
    case 'infra':
      output.title('generating layer infra...');
      generate.getIt.get<GenerateInfra>().call('${p.current}/$path');
      break;
    case 'external':
      output.title('generating layer external...');
      generate.getIt.get<GenerateExternal>().call('${p.current}/$path');
      break;
    case 'ui':
      output.title('generating layer ui...');
      generate.getIt.get<GenerateUI>().call('${p.current}/$path');
      break;
    case 'complete':
      output.title('generating complete clean dart arch...');
      generate.getIt.get<GenerateComplete>().call('${p.current}/$path');
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
