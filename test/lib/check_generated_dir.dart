// Created by alex@justprodev.com on 18.02.2025.

import 'dart:io';

void prepareGeneratedDir([String testDir = 'test']) {
  final generatedDir = Directory('$testDir/generated');

  if (generatedDir.existsSync()) {
    generatedDir.deleteSync(recursive: true);
  }
  generatedDir.createSync();

  Directory goldenDir = Directory('$testDir/golden');

  if (goldenDir.existsSync()) {
    for(var f in goldenDir.listSync()) {
      if(f is File) {
        f.copySync(f.path.replaceAll('golden', 'generated'));
      }
    }
  }
}