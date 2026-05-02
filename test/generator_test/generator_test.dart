// Created by alex@justprodev.com on 17.02.2025.

import 'dart:convert';
import 'dart:io';

// ignore_for_file: avoid_print, avoid_relative_lib_imports

import 'package:flutter_localizations_ota/src/generator/generator.dart';
import 'package:test/test.dart';

import '../lib/check_generated_dir.dart';

const generatorResultFileName = 'test_generator_result.dart';

const testDir = 'test/generator_test';

void main() {

  test('test generator itself', () async {
    prepareGeneratedDir(testDir);

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
import '../../lib/fake_arb_worker.dart';
import 'package:test/test.dart';

void main() {
  final L10n l10n = L10nEn();
  final arbWorker = FakeArbWorker({}, 'en');
  final L10n l10nRemote = L10nRemote(l10n, arbWorker);

  test('Test generated l10n', () {
    expect(l10n.fl_ota_version, l10nRemote.fl_ota_version);
    expect(arbWorker.lastRequestedKey, 'fl_ota_version');
    expect(arbWorker.lastRequestedArgs, null);

    expect(l10n.nMails(0, 'name'), l10nRemote.nMails(0, 'name'));
    expect(arbWorker.lastRequestedKey, 'nMails');
    expect(arbWorker.lastRequestedArgs, {'count': 0, 'name': 'name'});

    expect(l10n.nMails(1, 'name1'), l10nRemote.nMails(1, 'name1'));
    expect(arbWorker.lastRequestedKey, 'nMails');
    expect(arbWorker.lastRequestedArgs, {'count': 1, 'name': 'name1'});

    expect(l10n.nMails(2, 'name2'), l10nRemote.nMails(2, 'name2'));
    expect(arbWorker.lastRequestedKey, 'nMails');
    expect(arbWorker.lastRequestedArgs, {'count': 2, 'name': 'name2'});

    expect(l10n.nMails(3, 'name3'), l10nRemote.nMails(3, 'name3'));
    expect(arbWorker.lastRequestedKey, 'nMails');
    expect(arbWorker.lastRequestedArgs, {'count': 3, 'name': 'name3'});

    expect(l10n.nMails(4, 'name4'), l10nRemote.nMails(4, 'name4'));
    expect(arbWorker.lastRequestedKey, 'nMails');
    expect(arbWorker.lastRequestedArgs, {'count': 4, 'name': 'name4'});

    expect(l10n.nMails(5, 'name5'), l10nRemote.nMails(5, 'name5'));
    expect(arbWorker.lastRequestedKey, 'nMails');
    expect(arbWorker.lastRequestedArgs, {'count': 5, 'name': 'name5'});

    expect(l10n.new_test_key, l10nRemote.new_test_key);
    expect(arbWorker.lastRequestedKey, 'new_test_key');
    expect(arbWorker.lastRequestedArgs, null);

    expect(l10n.pageHomeBirthday('name'), l10nRemote.pageHomeBirthday('name'));
    expect(arbWorker.lastRequestedKey, 'pageHomeBirthday');
    expect(arbWorker.lastRequestedArgs, {'sex': 'name'});

    expect(l10n.trafficLight('red'), l10nRemote.trafficLight('red'));
    expect(arbWorker.lastRequestedKey, 'trafficLight');
    expect(arbWorker.lastRequestedArgs, {'light': 'red'});

    expect(l10n.trafficLight('yellow'), l10nRemote.trafficLight('yellow'));
    expect(arbWorker.lastRequestedKey, 'trafficLight');
    expect(arbWorker.lastRequestedArgs, {'light': 'yellow'});

    expect(l10n.trafficLight('green'), l10nRemote.trafficLight('green'));
    expect(arbWorker.lastRequestedKey, 'trafficLight');
    expect(arbWorker.lastRequestedArgs, {'light': 'green'});

    expect(l10n.trafficLight('abc'), l10nRemote.trafficLight('abc'));
    expect(arbWorker.lastRequestedKey, 'trafficLight');
    expect(arbWorker.lastRequestedArgs, {'light': 'abc'});
  });
}
''');
  return output.close();
}