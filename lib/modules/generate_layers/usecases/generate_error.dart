import 'dart:io';

import 'package:clean_dart_cli/shared/errors/file_exists_error.dart';
import 'package:clean_dart_cli/shared/interfaces/igenerate_error.dart';
import 'package:clean_dart_cli/shared/templates/error_template.dart';
import 'package:recase/recase.dart';

class GenerateError implements IGenerateError {
  @override
  Future<bool> call(String errorName, String path) async {
    var isValidDirectory = await Directory(path).exists();

    if (isValidDirectory) {
      var existFile =
          await File('${path}/${ReCase(errorName).snakeCase}_error.dart')
              .exists();

      if (existFile) {
        throw FileExistsError();
      }

      await File('${path}/${ReCase(errorName).snakeCase}_error.dart')
          .createSync(recursive: true);
      var content = errorTemplate(errorName);

      await File('${path}/${ReCase(errorName).snakeCase}_error.dart')
          .writeAsStringSync(content);
      return true;
    } else {
      return false;
    }
  }
}
