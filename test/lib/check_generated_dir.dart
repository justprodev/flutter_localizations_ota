// Created by alex@justprodev.com on 18.02.2025.

import 'dart:io';

void checkGeneratedDir() {
  final generatedDir = Directory('test/generated');
  if (!generatedDir.existsSync()) {
    generatedDir.createSync();
  }
}