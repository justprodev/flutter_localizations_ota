import 'dart:io';

import 'package:yaml/yaml.dart';
import 'model/l10n_yaml.dart';
import 'model/templates.dart';

Future<void> generate([String path = 'l10n.yaml']) async {
  final yaml = L10nYaml(loadYaml(await File(path).readAsString()));

  File input = File('${yaml.outputDir}/${yaml.outputLocalizationFile}');
  IOSink output = File(
    '${yaml.outputDir}/${yaml.outputLocalizationFile.replaceFirst('.dart', '_remote.dart')}',
  ).openWrite();

  output.writeln(header
      .replaceAll('@(baseClassFile)', yaml.outputLocalizationFile)
      .replaceAll('@(baseClass)', yaml.outputClass)
      .trim());

  final lines = await input.readAsLines();

  final lastComments = <String>[];

  for (int i = 0; i < lines.length; i++) {
    final line = lines[i].trimLeft();
    if (line.startsWith('String ')) {
      output.writeln();
      if (lastComments.isNotEmpty) {
        lastComments.forEach(output.writeln);
        lastComments.clear();
      }

      if (line.startsWith('String get')) {
        final key = line.split('get')[1].split(';')[0].trim();
        output.writeln(_generateField(key));
      } else {
        final key = line.split(' ')[1].split('(').first;
        final paramPairs = lines[i].split('(').last.split(')')[0].split(',');

        final parameters = <String, String>{};

        for (var pair in paramPairs) {
          final parts = pair.trim().split(' ');
          parameters[parts[0].trimRight()] = parts[1].trimLeft();
        }

        output.writeln(_generateMethod(key, parameters));
      }
    } else if(line.startsWith('//')) {
      lastComments.add(lines[i]);
    } else {
      lastComments.clear();
    }
  }

  output.writeln('}');
  output.writeln();

  output.writeln(footer.replaceAll('@(baseClass)', yaml.outputClass).trim());

  await output.close();
}

String _generateField(String key) {
  return '\tString get $key => _arb.get(\'$key\') ?? base.$key;';
}

String _generateMethod(String key, Map<String, String> parameters) {
  final sParameters = parameters.entries.map((e) => '${e.key} ${e.value}').join(', ');
  final sParameterNames = parameters.values.join(', ');

  // like _arb.get('title', {'name': name}) for arb string '"title": "translated title {name}"'
  final sArbCall = '_arb.get(\'$key\', {${parameters.values.map((e) => '\'$e\': $e').join(', ')}})';

  return '\tString $key($sParameters) => $sArbCall ?? base.$key($sParameterNames);';
}
