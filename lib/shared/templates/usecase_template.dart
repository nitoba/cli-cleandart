String usecaseTemplate(String usecaseName) {
  var output = '''
abstract class I$usecaseName {
  Future<void>call();
}


class $usecaseName implements I$usecaseName {
  @override
  Future<void> call() {
    // TODO: implement call
    throw UnimplementedError();
  }
  
}
  ''';

  return output;
}
