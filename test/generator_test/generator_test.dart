// Created by alex@justprodev.com on 17.02.2025.

import 'dart:convert';
import 'dart:io';

// ignore_for_file: avoid_print, avoid_relative_lib_imports

import 'package:flutter_localizations_ota/src/generator/generator.dart';
import 'package:test/test.dart';

const generatorResultFileName = 'check_generator_result.g.dart';

const testDir = 'test/generator_test';

void main() {

  test('test generator itself', () async {
    await generate('$testDir/l10n.yaml');

    await _generateTestFile();

    final result = Process.runSync(
      Platform.isWindows ? 'flutter.bat' : 'flutter',
      ['test', '$testDir/generated/$generatorResultFileName'],
      stdoutEncoding: Encoding.getByName('UTF-8'),
      stderrEncoding: Encoding.getByName('UTF-8'),
    );

    print(result.stdout);
    print(result.stderr);

    expect(result.exitCode, 0);
  });

  test('invoking "dart run flutter_localizations_ota:generate"', () async {
    // just checking that `dart run flutter_localizations_ota:generate` calls the generator
    final result = Process.runSync(
      'dart',
      ['run', 'flutter_localizations_ota:generate'],
      stdoutEncoding: Encoding.getByName('UTF-8'),
      stderrEncoding: Encoding.getByName('UTF-8'),
    );

    // the error from generator is expected, because there is no l10n.yaml in the root of the project
    expect(result.stderr.toString(), contains('PathNotFoundException'));
  });
}

Future<void> _generateTestFile() {
  final output = File('$testDir/generated/$generatorResultFileName').openWrite();

  output.writeln('''
// file is used to test the generated l10n_remote.dart file
// The file will be invoked by the generator_test.dart

import 'l10n.dart';
import 'l10n_en.dart';
import 'l10n_remote.dart';
import '../lib/compare_local_vs_remote.dart';
import 'package:test/test.dart';

void main() {
  test('Test generated l10n', () {
    final l10n = L10nEn();
    final arbWorker = FakeArbWorker();
    final l10nRemote = L10nRemote(l10n, arbWorker);
    
    compareLocalVsRemote(l10n, l10nRemote, arbWorker);
  });
}
''');
  return output.close();
}