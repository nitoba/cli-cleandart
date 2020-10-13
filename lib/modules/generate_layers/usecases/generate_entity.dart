import 'dart:io';

import 'package:clean_dart_cli/shared/errors/file_exists_error.dart';
import 'package:clean_dart_cli/shared/interfaces/igenerate_entity.dart';
import 'package:clean_dart_cli/shared/templates/entity_template.dart';
import 'package:recase/recase.dart';

class GenerateEntity implements IGenerateEntity {
  @override
  Future<bool> call(String entityName, String path) async {
    var isValidDirectory = await Directory(path).exists();
    if (isValidDirectory) {
      var existFile =
          await File('${path}/${ReCase(entityName).snakeCase}_entity.dart')
              .exists();

      if (existFile) {
        throw FileExistsError();
      }

      await File('${path}/${ReCase(entityName).snakeCase}_entity.dart')
          .createSync(recursive: true);
      var content = entityTemplate(entityName);
      await File('${path}/${ReCase(entityName).snakeCase}_entity.dart')
          .writeAsStringSync(content);
      return true;
    } else {
      return false;
    }
  }
}
