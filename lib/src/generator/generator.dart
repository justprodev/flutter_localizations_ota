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
        final key = line.split('get ')[1].split(';')[0].trim();
        output.writeln(_generateField(key));
      } else {
        final key = line.split(' ')[1].split('(').first;
        final methodSignature = _getMethodSignature(lines, i);
        i += methodSignature.length - 1;
        final paramPairs =
            methodSignature.join(' ').split('(').last.split(')')[0].split(',');

        // Parameters map of name:type, e.g. 'count':'int'
        final parameters = {
          for (final pair in paramPairs)
            if (pair.trim().split(' ') case final parts when parts.length > 1)
              parts[1].trimRight(): parts[0].trimLeft(),
        };

        output.writeln(_generateMethod(key, parameters));
      }
    } else if (line.startsWith('//')) {
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

List<String> _getMethodSignature(List<String> lines, int start) {
  for (var i = start; i < lines.length; i++) {
    if (lines[i].contains(';')) {
      return lines.sublist(start, i + 1);
    }
  }
  return lines.sublist(start);
}

String _generateField(String key) {
  return '\tString get $key => _arb.get(\'$key\') ?? base.$key;';
}

String _generateMethod(String key, Map<String, String> parameters) {
  final sParameters =
      parameters.entries.map((e) => '${e.value} ${e.key}').join(', ');
  final sParameterNames = parameters.keys.join(', ');

  // like _arb.get('title', {'name': name}) for arb string '"title": "translated title {name}"'
  final sArbCall =
      '_arb.get(\'$key\', {${parameters.keys.map((e) => '\'$e\': $e').join(', ')}})';

  return '\tString $key($sParameters) => $sArbCall ?? base.$key($sParameterNames);';
}
