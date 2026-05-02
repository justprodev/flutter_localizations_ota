// Created by alex@justprodev.com on 13.02.2025.

import 'dart:convert';
import 'dart:io';

// ignore_for_file: avoid_print, avoid_relative_lib_imports

import 'package:flutter_localizations_ota/src/arb_worker/arb_parser.dart';
import 'package:flutter_localizations_ota/src/arb_worker/arb_worker.dart';
import 'package:test/test.dart';

import '../lib/check_generated_dir.dart';

const testDir = 'test/arb_worker_test';

main() {
  group('english straightforward working well', () {
    final testArb = File('$testDir/app_en.arb').readAsStringSync();
    var worker = ArbWorker(parseArbContent(testArb), 'en');

    test('retrieves the single key', () {
      expect(worker.get('fl_ota_version'), equals('1'));
      expect(worker.get('new_test_key'), equals('A new test key'));
    });
    test('retrieves the correct translation with plurals', () {
      expect(worker.get('nMails', {'count': 0, 'name': 'Nico'}), equals('You have no mails, Nico'));
      expect(worker.get('nMails', {'count': 1, 'name': 'Nico'}), equals('Nico! You have one mail!'));
      expect(worker.get('nMails', {'count': 2, 'name': 'Nico'}), equals('You have two mails, Nico'));
      expect(worker.get('nMails', {'count': 4, 'name': 'Nico'}), equals('You have like 4 mails, Nico'));
      expect(worker.get('nMails', {'count': 13, 'name': 'Nico'}), equals('You have like 13 mails, Nico'));
      expect(worker.get('nMails', {'count': 3456, 'name': 'Nico'}), equals('You have like 3456 mails, Nico'));
    });
    test('retrieves the correct translation with genders', () {
      expect(worker.get('pageHomeBirthday', {'sex': 'male'}), equals('His birthday'));
      expect(worker.get('pageHomeBirthday', {'sex': 'female'}), equals('Her birthday'));
      expect(worker.get('pageHomeBirthday', {'sex': 'anything'}), equals('The birthday of them'));
      expect(worker.get('pageHomeBirthday', {'sex': 'anything else'}), equals('The birthday of them'));
      expect(worker.get('pageHomeBirthday', {'sex': 'other'}), equals('The birthday of them'));
    });
    test('retrieves the correct translation with select', () {
      expect(worker.get('trafficLight', {'light': 'red'}), equals('stop'));
      expect(worker.get('trafficLight', {'light': 'yellow'}), equals('ready to go'));
      expect(worker.get('trafficLight', {'light': 'green'}), equals('go'));
      expect(worker.get('trafficLight', {'light': 'ngangong'}), equals('-'));
    });

    test('order', () {
      expect(worker.get('nMails', {'name': 'Nico', 'count': 2}), equals('You have two mails, Nico'));
    });
  });

  // generating test file, writing tests and running them via `flutter test`
  test('Compare ARB translator nodes with L10n', () async {
    const generatedFileName = 'l10n_test.g.dart';
    final nodes = parseArbContent(File('$testDir/app_ru.arb').readAsStringSync());
    ArbWorker arbWorker = ArbWorker(nodes, 'ru');

    prepareGeneratedDir(testDir);
    File input = File('$testDir/golden/l10n_ru.dart');
    IOSink output = File('$testDir/generated/$generatedFileName').openWrite();

    output.writeln('''
import 'l10n_ru.dart';
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
      ['test', '$testDir/generated/$generatedFileName'],
      stdoutEncoding: Encoding.getByName('UTF-8'),
      stderrEncoding: Encoding.getByName('UTF-8'),
    );

    print(result.stdout);
    print(result.stderr);

    expect(result.exitCode, 0);
    expect(testedCallsCount, nodes.keys.length);
  });
}
