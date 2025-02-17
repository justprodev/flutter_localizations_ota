// Created by alex@justprodev.com on 17.02.2025.

import 'dart:convert';
import 'dart:io';

// ignore_for_file: avoid_print

import 'package:flutter_localizations_ota/src/generator/generator.dart';
import 'package:test/test.dart';

const generatorResultFileName = '_generator_result_test.dart_';

void main() {
  test('test generator itself', () async {
    for(var f in Directory('test/golden').listSync()) {
      if(f is File) {
        f.copySync(f.path.replaceAll('golden', 'generated'));
      }
    }
    await generate('test/golden/l10n.yaml');

    final result = Process.runSync(
      Platform.isWindows ? 'flutter.bat' : 'flutter',
      ['test', 'test/generated/$generatorResultFileName'],
      stdoutEncoding: Encoding.getByName('UTF-8'),
      stderrEncoding: Encoding.getByName('UTF-8'),
    );

    print(result.stdout);
    print(result.stderr);

    expect(result.exitCode, 0);
  });

  test('invoking "dart run flutter_localizations_ota:generate"', () async {
    final result = Process.runSync(
      'dart',
      ['run', 'flutter_localizations_ota:generate'],
      stdoutEncoding: Encoding.getByName('UTF-8'),
      stderrEncoding: Encoding.getByName('UTF-8'),
    );

    expect(result.stderr.toString(), contains('PathNotFoundException'));
  });
}
