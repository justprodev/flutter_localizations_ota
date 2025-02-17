// Created by alex@justprodev.com on 12.11.2024.

import 'arb_store_base.dart';

class ArbStore implements ArbStoreBase {
  const ArbStore();

  @override
  Future<int> getArbVersion(String localeName) {
    throw UnimplementedError();
  }

  @override
  Future<String> getArbContent(String localeName) {
    throw UnimplementedError();
  }

  @override
  Future<void> putArb(String localeName, int arbVersion, String arbContent) {
    throw UnimplementedError();
  }
}
