import 'package:clean_dart_cli/shared/interfaces/igenerate_usecases.dart';
import 'package:clean_dart_cli/shared/utils/output_utils.dart' as output;
import 'package:path/path.dart' as p;

class GenerateUsecaseController {
  final IGenerateUsecases _generateUsecases;

  GenerateUsecaseController(this._generateUsecases);
  Future<void> genereteUsecase(String usecaseName, String path) async {
    output.warn('generating usecase $usecaseName....');
    var pathNomalized = p.normalize('${p.current}/$path');
    var result = await _generateUsecases.call(usecaseName, pathNomalized);

    if (result) {
      output.title('$usecaseName created');
      return;
    }
    output.error('Directory not exists');
  }
}
