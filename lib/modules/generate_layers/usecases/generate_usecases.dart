import 'dart:io';

import 'package:clean_dart_cli/shared/interfaces/igenerate_usecases.dart';

class GenerateUsecases implements IGenerateUsecases {
  @override
  Future<bool> call(String usecaseName, String path) async {
    var isValidDirectory = await Directory(path).exists();

    if (isValidDirectory) {
      await File('${path}/${usecaseName}_usecase.dart')
          .createSync(recursive: true);
      await File('${path}/${usecaseName}_usecase.dart')
          .writeAsStringSync('contents');
      return true;
    } else {
      return false;
    }
  }
}
