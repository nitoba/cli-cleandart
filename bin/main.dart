import 'package:args/args.dart';
import 'package:clean_dart_cli/modules/app_module.dart';
import 'package:clean_dart_cli/modules/generate_layers/controllers/generate_layer_controller.dart';
import 'package:clean_dart_cli/modules/generate_layers/controllers/generate_usecase_controller.dart';
import 'package:clean_dart_cli/shared/utils/output_utils.dart' as output;

AppModule appModule;
void main(List<String> arguments) {
  _wellcomeMessage();
  appModule = AppModule();
  var generateLayerController =
      appModule.generate.getIt<GenerateLayerController>();
  var generateUsecaseController =
      appModule.generate.getIt<GenerateUsecaseController>();

  var isValidArguments = _validateArguments(arguments);

  if (isValidArguments != null) {
    switch (isValidArguments) {
      case 'layer':
        generateLayerController.generateLayerFolders(
          layeCommand: arguments[2],
          path: arguments.length == 4 ? arguments[3] : './',
        );
        break;
      case 'usecase':
        generateUsecaseController.genereteUsecase();
        break;
      default:
    }
  }
}

String _validateArguments(List<String> arguments) {
  if (arguments.isEmpty) {
    output.error('No arguments, try with --help or -h');
    return null;
  }

  if (arguments.length < 3) {
    output.error('Invalid command, try with --help or -h');
    return null;
  }
  var isValidArguments =
      appModule.argParser.options[arguments[0]].allowed.contains(arguments[1]);
  if (isValidArguments) {
    output.title('Valid command');
    return arguments[1];
  } else {
    output.error('Invalid command, try with --help or -h');
    return null;
  }
}

void _wellcomeMessage() {
  output.title('################### Clean Dart CLI ###################');
}
