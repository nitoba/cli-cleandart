String repositoryTemplate(String entityName) {
  var output = '''
class ${entityName}Entity {
  final String id;
  final String userName;

  GeneratedEntity({this.id, this.userName});
}
  ''';

  return output;
}
