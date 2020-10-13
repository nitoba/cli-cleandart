import 'package:recase/recase.dart';

String modelJsTemplate(String modelName) {
  var output = '''
import 'package:json_annotation/json_annotation.dart';

part '${ReCase(modelName).snakeCase}_model.g.dart';

@JsonSerializable()
class ${ReCase(modelName).pascalCase}Model extends ${modelName}Entity {
  ${ReCase(modelName).pascalCase}Model({String id, String userName}):super(
    id:id, userName:userName,
    );

  factory ${ReCase(modelName).pascalCase}.fromJson(Map<String, dynamic> json) =>_\$${ReCase(modelName).pascalCase}FromJson(json);

  Map<String, dynamic> toJson() => _\$${ReCase(modelName).pascalCase}ToJson(this);
  
}
  ''';

  return output;
}
