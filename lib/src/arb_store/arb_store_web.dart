// Created by alex@justprodev.com on 17.02.2025.

import 'arb_store_base.dart';

class ArbStore extends ArbStoreBase {
  const ArbStore();

  @override
  Future<int> getArbVersion(String localeName) {
    // return minimal version to skip `getArbContent` call
    return Future.value(-1);
  }

  @override
  Future<String> getArbContent(String localeName) {
    throw UnimplementedError();
  }

  @override
  Future<void> putArb(String localeName, int arbVersion, String arbContent) {
    return Future.value();
  }
}
