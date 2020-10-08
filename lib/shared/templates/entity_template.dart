String entityTemplate(String entityName) {
  var output = '''
class ${entityName}Entity {
  final String id;
  final String userName;

  ${entityName}Entity({this.id, this.userName});
}
  ''';

  return output;
}
