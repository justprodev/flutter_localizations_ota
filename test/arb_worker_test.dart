// Created by alex@justprodev.com on 13.02.2025.

import 'dart:io';

import 'package:flutter_localizations_ota/src/arb_worker/arb_parser.dart';
import 'package:flutter_localizations_ota/src/arb_worker/arb_worker.dart';
import 'package:test/test.dart';

main() {
  group('english straightforward working well', () {
    final testArb = File('test/golden/app_en.arb').readAsStringSync();
    var worker = ArbWorker(parseArbContent(testArb), 'en');

    test('retrieves the single key', () {
      expect(worker.get('fl_ota_version'), equals('1'));
      expect(worker.get('new_test_key'), equals('A new test key'));
    });
    test('retrieves the correct translation with plurals', () {
      expect(worker.get('nMails', {'count': 0, 'name': 'Nico'}), equals('You have no mails, Nico'));
      expect(worker.get('nMails', {'count': 1, 'name': 'Nico'}), equals('Nico! You have one mail!'));
      expect(worker.get('nMails', {'count': 2, 'name': 'Nico'}), equals('You have two mails, Nico'));
      expect(worker.get('nMails', {'count': 4, 'name': 'Nico'}), equals('You have like 4 mails, Nico'));
      expect(worker.get('nMails', {'count': 13, 'name': 'Nico'}), equals('You have like 13 mails, Nico'));
      expect(worker.get('nMails', {'count': 3456, 'name': 'Nico'}), equals('You have like 3456 mails, Nico'));
    });
    test('retrieves the correct translation with genders', () {
      expect(worker.get('pageHomeBirthday', {'sex': 'male'}), equals('His birthday'));
      expect(worker.get('pageHomeBirthday', {'sex': 'female'}), equals('Her birthday'));
      expect(worker.get('pageHomeBirthday', {'sex': 'anything'}), equals('The birthday of them'));
      expect(worker.get('pageHomeBirthday', {'sex': 'anything else'}), equals('The birthday of them'));
      expect(worker.get('pageHomeBirthday', {'sex': 'other'}), equals('The birthday of them'));
    });
    test('retrieves the correct translation with select', () {
      expect(worker.get('trafficLight', {'light': 'red'}), equals('stop'));
      expect(worker.get('trafficLight', {'light': 'yellow'}), equals('ready to go'));
      expect(worker.get('trafficLight', {'light': 'green'}), equals('go'));
      expect(worker.get('trafficLight', {'light': 'ngangong'}), equals('-'));
    });

    test('order', () {
      expect(worker.get('nMails', {'name': 'Nico', 'count': 2}), equals('You have two mails, Nico'));
    });
  });
}
