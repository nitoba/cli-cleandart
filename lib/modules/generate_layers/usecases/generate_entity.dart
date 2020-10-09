import 'dart:io';

import 'package:clean_dart_cli/shared/interfaces/igenerate_entity.dart';
import 'package:clean_dart_cli/shared/templates/entity_template.dart';

class GenerateEntity implements IGenerateEntity {
  @override
  Future<bool> call(String entityName, String path) async {
    var isValidDirectory = await Directory(path).exists();
    if (isValidDirectory) {
      await File('${path}/${entityName.toLowerCase()}_model.dart')
          .createSync(recursive: true);
      var content = entityTemplate(entityName);
      await File('${path}/${entityName.toLowerCase()}_model.dart')
          .writeAsStringSync(content);
      return true;
    } else {
      return false;
    }
  }
}
