import 'package:args/args.dart';

import 'generate_layers/generate_module.dart';

class AppModule {
  GenerateModule generate;
  ArgResults argResults;
  ArgParser argParser;

  void _addOptionsArguments(ArgParser argParser) {
    argParser.addOption(
      'gen',
      abbr: 'g',
      allowed: ['layer', 'usecase', 'datasource', 'repository', 'model'],
      help: 'command to generate something',
    );

    argParser.addFlag('help', abbr: 'h', negatable: false);

    argParser.addFlag('version', abbr: 'v', negatable: false);
  }

  void _bootstrap() {
    argParser = ArgParser();
    _addOptionsArguments(argParser);
    generate = GenerateModule();
  }

  AppModule() {
    _bootstrap();
  }
}
