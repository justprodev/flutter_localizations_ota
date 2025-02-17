// Created by alex@justprodev.com on 17.02.2025.

import 'dart:io';

import 'package:path_provider/path_provider.dart';

import 'arb_store_base.dart';

String? _storePath;

class ArbStore extends ArbStoreBase {
  const ArbStore();

  @override
  Future<int> getArbVersion(String localeName) async {
    if (_storePath == null) await _initStore();
    var file = File('$_storePath/app_$localeName.version');
    if (!await file.exists()) {
      return -1;
    }
    return int.parse(await file.readAsString());
  }

  @override
  Future<String> getArbContent(String localeName) async {
    if (_storePath == null) await _initStore();
    return File('$_storePath/app_$localeName.arb').readAsString();
  }

  @override
  Future<void> putArb(String localeName, int arbVersion, String arbContent) async {
    if (_storePath == null) await _initStore();
    await Future.wait([
      File('$_storePath/app_$localeName.version').writeAsString('$arbVersion'),
      File('$_storePath/app_$localeName.arb').writeAsString(arbContent),
    ]);
  }

  Future<void> _initStore() async {
    var dir = await getApplicationSupportDirectory();
    final storePath = '${dir.path}/arb';
    if (!await Directory(storePath).exists()) {
      await Directory(storePath).create();
    }
    _storePath = storePath;
  }
}
