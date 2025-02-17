// Created by alex@justprodev.com on 13.02.2025.

import 'dart:convert';
import 'dart:io';

import 'package:flutter_localizations_ota/src/arb_worker/arb_parser.dart';
import 'package:flutter_localizations_ota/src/arb_worker/arb_worker.dart';
import 'package:test/test.dart';

import 'lib/check_generated_dir.dart';

const generatedFileName = 'l10n_test.g.dart';

void main() {
  // generating test file, writing tests and running them via `flutter test`
  test('Compare ARB translator nodes with L10n', () async {
    final nodes = parseArbContent(File('test/golden2/app_ru.arb').readAsStringSync());
    ArbWorker arbWorker = ArbWorker(nodes, 'ru');

    File input = File('test/golden2/l10n_ru.dart');
    checkGeneratedDir();
    IOSink output = File('test/generated/$generatedFileName').openWrite();

    output.writeln('''
import '../golden2/l10n_ru.dart';
import 'package:test/test.dart';

void main() {
  L10nRu l10n = L10nRu();

  test('Test generated l10n', () {
    ''');

    final lines = input.readAsLinesSync();

    var testedCallsCount = 0;

    // enumerate methods and call it
    for (int i = 0; i < lines.length; i++) {
      if (lines[i].trimLeft().startsWith("@override")) {
        i++;
        if (lines[i].trimLeft().startsWith('String get')) {
          final key = lines[i].split('get')[1].split('=>')[0].trim();
          output.writeln("\t\texpect(l10n.$key, '''${arbWorker.get(key)}''');");
          testedCallsCount++;
        } else {
          final key = lines[i].trimLeft().split(' ')[1].split('(').first;
          final params = lines[i].split('(').last.split(')')[0].split(',');

          for(int i = 0; i < 5; i++) {
            final args = <String, dynamic>{};
            final values = <dynamic>[];
            for (var param in params) {
              final pair = param.trim().split(' ');

              if(pair[0] == 'String') {
                args[pair[1]] = 'string$i';
                values.add('\'${args[pair[1]]}\'');
              } else {
                args[pair[1]] = i;
                values.add(i);
              }
            }
            output.writeln(
              "\t\texpect(l10n.$key(${values.join(',')}), '''${arbWorker.get(key, args)}''');",
            );
          }
          testedCallsCount++;
        }
      }
    }

    output.writeln('''
  });
}
    ''');

    await output.close();

    final result = Process.runSync(
      Platform.isWindows ? 'flutter.bat' : 'flutter',
      ['test', 'test/generated/$generatedFileName'],
      stdoutEncoding: Encoding.getByName('UTF-8'),
      stderrEncoding: Encoding.getByName('UTF-8'),
    );

    print(result.stdout);
    print(result.stderr);

    expect(result.exitCode, 0);
    expect(testedCallsCount, nodes.keys.length);
  });
}
