// Created by alex@justprodev.com on 02.05.2026.

import 'package:flutter_localizations_ota/src/arb_worker/arb_worker.dart';

/// A test implementation of the ARB worker that records the last requested key and arguments.
class FakeArbWorker extends ArbWorker {
  FakeArbWorker(super.arbNodes, super.locale);

  String? lastRequestedKey;
  Map<String, dynamic>? lastRequestedArgs;

  @override
  String? get(String key, [Map<String, dynamic>? args]) {
    lastRequestedKey = key;
    lastRequestedArgs = args;
    return null;
  }
}