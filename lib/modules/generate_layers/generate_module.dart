import 'package:clean_dart_cli/modules/generate_layers/controllers/generate_layer_controller.dart';
import 'package:get_it/get_it.dart';
import 'usecases/generate_complete.dart';
import 'usecases/generate_damain.dart';
import 'usecases/generate_external.dart';
import 'usecases/generate_infra.dart';
import 'usecases/generate_ui.dart';

class GenerateModule {
  final getIt = GetIt.instance;

  void _setup() {
    getIt.registerLazySingleton<GenerateDomain>(() => GenerateDomain());
    getIt.registerLazySingleton<GenerateInfra>(() => GenerateInfra());
    getIt.registerLazySingleton<GenerateExternal>(() => GenerateExternal());
    getIt.registerLazySingleton<GenerateUI>(() => GenerateUI());
    getIt.registerLazySingleton<GenerateComplete>(
      () => GenerateComplete(
        getIt.get<GenerateDomain>(),
        getIt.get<GenerateInfra>(),
        getIt.get<GenerateExternal>(),
        getIt.get<GenerateUI>(),
      ),
    );
    getIt.registerLazySingleton<GenerateLayerController>(
        () => GenerateLayerController());
  }

  GenerateModule() {
    _setup();
  }
}
