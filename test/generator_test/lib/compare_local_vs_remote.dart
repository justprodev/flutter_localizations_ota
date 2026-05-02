// Created by alex@justprodev.com on 02.05.2026.

// ignore_for_file: avoid_relative_lib_imports

import 'package:flutter_localizations_ota/src/arb_worker/arb_worker.dart';

import '../generated/l10n.dart';
import 'package:test/test.dart';

void compareLocalVsRemote(L10n l10n, L10n l10nRemote, FakeArbWorker arbWorker) {
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
}

/// A test implementation of the ARB worker that records the last requested key and arguments.
class FakeArbWorker extends ArbWorker {
  FakeArbWorker() : super({}, 'en');

  String? lastRequestedKey;
  Map<String, dynamic>? lastRequestedArgs;

  @override
  String? get(String key, [Map<String, dynamic>? args]) {
    lastRequestedKey = key;
    lastRequestedArgs = args;
    return null;
  }
}
