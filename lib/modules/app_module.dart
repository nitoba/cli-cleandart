import 'generate_layers/generate_module.dart';

class AppModule {
  GenerateModule generate;

  void _bootstrap() {
    generate = GenerateModule();
  }

  AppModule() {
    _bootstrap();
  }
}
