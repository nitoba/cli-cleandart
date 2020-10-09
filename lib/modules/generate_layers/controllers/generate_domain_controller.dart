import 'package:clean_dart_cli/shared/interfaces/igenerate_entity.dart';
import 'package:clean_dart_cli/shared/interfaces/igenerate_usecases.dart';
import 'package:clean_dart_cli/shared/utils/output_utils.dart' as output;
import 'package:path/path.dart' as p;

class GenerateDoaminController {
  final IGenerateUsecases _generateUsecases;
  final IGenerateEntity _generateEntity;

  GenerateDoaminController(this._generateUsecases, this._generateEntity);
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

  Future<void> generateEntity(String entityName, String path) async {
    output.warn('generating usecase $entityName....');
    var pathNomalized = p.normalize('${p.current}/$path');
    var result = await _generateEntity.call(entityName, pathNomalized);
    if (result) {
      output.title('$entityName created');
      return;
    }
    output.error('Directory not exists');
  }
}
