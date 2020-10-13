import 'package:recase/recase.dart';

String modelTemplate(String modelName) {
  var output = '''
class ${ReCase(modelName).pascalCase}Model extends ${ReCase(modelName).pascalCase}Entity {
  ${ReCase(modelName).pascalCase}Model({String id, String userName}):super(
    id:id, userName:userName,
  );

factory ${modelName}Model.fromJson(Map<String, dynamic> json) {
    return ${ReCase(modelName).pascalCase}Model(
      id: json['id'],
      userName: json['username'],
    );
  }
  
}
  ''';

  return output;
}
