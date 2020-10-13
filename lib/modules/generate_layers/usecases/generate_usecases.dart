import 'dart:io';

import 'package:clean_dart_cli/shared/errors/file_exists_error.dart';
import 'package:clean_dart_cli/shared/interfaces/igenerate_usecases.dart';
import 'package:clean_dart_cli/shared/templates/usecase_template.dart';
import 'package:recase/recase.dart';

class GenerateUsecases implements IGenerateUsecases {
  @override
  Future<bool> call(String usecaseName, String path) async {
    var isValidDirectory = await Directory(path).exists();

    var existFile =
        await File('${path}/${ReCase(usecaseName).snakeCase}_usecase.dart')
            .exists();

    if (existFile) {
      throw FileExistsError();
    }

    if (isValidDirectory) {
      await File('${path}/${ReCase(usecaseName).snakeCase}_usecase.dart')
          .createSync(recursive: true);
      var content = usecaseTemplate(usecaseName);
      await File('${path}/${ReCase(usecaseName).snakeCase}_usecase.dart')
          .writeAsStringSync(content);
      return true;
    } else {
      return false;
    }
  }
}
