String entityTemplate(String modelName) {
  var output = '''
class ${modelName}Model extends ${modelName}Entity {
  GeneratedModel({String id, String userName}):super(
    id:id, userName:userName,
  );

factory ${modelName}Model.fromJson(Map<String, dynamic> json) {
    return ${modelName}Model(
      id: json['id'],
      userName: json['username'],
    );
  }
  
}
  ''';

  return output;
}
