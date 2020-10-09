import 'package:get_it/get_it.dart';

import '../../shared/interfaces/igenerate_entity.dart';
import '../../shared/interfaces/igenerate_model.dart';
import '../../shared/interfaces/igenerate_usecases.dart';
import 'controllers/generate_domain_controller.dart';
import 'controllers/generate_layer_controller.dart';
import 'usecases/generate_complete.dart';
import 'usecases/generate_damain.dart';
import 'usecases/generate_entity.dart';
import 'usecases/generate_external.dart';
import 'usecases/generate_infra.dart';
import 'usecases/generate_model.dart';
import 'usecases/generate_ui.dart';
import 'usecases/generate_usecases.dart';

class GenerateModule {
  final getIt = GetIt.instance;

  void _setup() {
    getIt.registerLazySingleton<IGenerateModel>(() => GenerateModel());
    getIt.registerLazySingleton<IGenerateEntity>(() => GenerateEntity());
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
      () => GenerateDoaminController(
        getIt.get<IGenerateUsecases>(),
        getIt.get<IGenerateEntity>(),
        getIt.get<IGenerateModel>(),
      ),
    );
  }

  GenerateModule() {
    _setup();
  }
}
