import 'package:clean_dart_cli/modules/generate_layers/controllers/generate_layer_controller.dart';
import 'package:clean_dart_cli/modules/generate_layers/usecases/generate_usecases.dart';
import 'package:clean_dart_cli/shared/interfaces/igenerate_usecases.dart';
import 'package:get_it/get_it.dart';
import 'controllers/generate_domain_controller.dart';
import 'usecases/generate_complete.dart';
import 'usecases/generate_damain.dart';
import 'usecases/generate_external.dart';
import 'usecases/generate_infra.dart';
import 'usecases/generate_ui.dart';

class GenerateModule {
  final getIt = GetIt.instance;

  void _setup() {
    getIt.registerLazySingleton<IGenerateUsecases>(() => GenerateUsecases());
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
      () => GenerateLayerController(
        getIt.get<GenerateDomain>(),
        getIt.get<GenerateInfra>(),
        getIt.get<GenerateExternal>(),
        getIt.get<GenerateUI>(),
        getIt.get<GenerateComplete>(),
      ),
    );
    getIt.registerLazySingleton<GenerateDoaminController>(
      () => GenerateDoaminController(getIt.get<IGenerateUsecases>()),
    );
  }

  GenerateModule() {
    _setup();
  }
}
