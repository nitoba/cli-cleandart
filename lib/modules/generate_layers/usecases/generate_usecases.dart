import 'dart:io';

import 'package:clean_dart_cli/shared/interfaces/igenerate_usecases.dart';
import 'package:clean_dart_cli/shared/templates/usecase_template.dart';

class GenerateUsecases implements IGenerateUsecases {
  @override
  Future<bool> call(String usecaseName, String path) async {
    var isValidDirectory = await Directory(path).exists();

    if (isValidDirectory) {
      await File('${path}/${usecaseName}_usecase.dart')
          .createSync(recursive: true);
      var content = usecaseTemplate(usecaseName);
      await File('${path}/${usecaseName}_usecase.dart')
          .writeAsStringSync(content);
      return true;
    } else {
      return false;
    }
  }
}
