import 'package:clean_dart_cli/modules/generate/generate_module.dart';
import 'package:clean_dart_cli/modules/generate/usecases/generate_damain.dart';
import 'package:path/path.dart' as p;

void main(List<String> arguments) {
  print(p.current);
  var generate = GenerateModule();
  generate.getIt.get<GenerateDomain>().call('${p.current}/example');
}
