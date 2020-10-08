import 'package:clean_dart_cli/shared/interfaces/igenerate_usecases.dart';
import 'package:clean_dart_cli/shared/utils/output_utils.dart' as output;
import 'package:get_it/get_it.dart';

class GenerateUsecaseController {
  final IGenerateUsecases _generateUsecases;

  GenerateUsecaseController(this._generateUsecases);
  void genereteUsecase() {
    final getIt = GetIt.instance;
    output.title('generating usecase...');
  }
}
