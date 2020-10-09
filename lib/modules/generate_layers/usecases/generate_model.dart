import 'dart:io';

import 'package:clean_dart_cli/shared/interfaces/igenerate_model.dart';
import 'package:clean_dart_cli/shared/templates/model_template.dart';

class GenerateModel implements IGenerateModel {
  @override
  Future<bool> call(String modelName, String path) async {
    var isValidDirectory = await Directory(path).exists();

    if (isValidDirectory) {
      await File('${path}/${modelName.toLowerCase()}_model.dart')
          .createSync(recursive: true);
      var content = modelTemplate(modelName);
      await File('${path}/${modelName.toLowerCase()}_model.dart')
          .writeAsStringSync(content);
      return true;
    } else {
      return false;
    }
  }
}
