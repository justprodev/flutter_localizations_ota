import 'package:intl/intl.dart' as intl;

import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class L10nEn extends L10n {
  L10nEn([String locale = 'en']) : super(locale);

  @override
  String get fl_ota_version => '1';

  @override
  String nMails(int count, Object name) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'You have like $count mails, $name',
      many: 'You have several ($count) mails, $name',
      few: 'You have $count mails, $name',
      two: 'You have two mails, $name',
      one: '$name! You have one mail!',
      zero: 'You have no mails, $name',
    );
    return '$_temp0';
  }

  @override
  String get new_test_key => 'A new test key';

  @override
  String pageHomeBirthday(String sex) {
    String _temp0 = intl.Intl.selectLogic(
      sex,
      {
        'male': 'His birthday',
        'female': 'Her birthday',
        'other': 'The birthday of them',
      },
    );
    return '$_temp0';
  }

  @override
  String trafficLight(String light) {
    String _temp0 = intl.Intl.selectLogic(
      light,
      {
        'red': 'stop',
        'yellow': 'ready to go',
        'green': 'go',
        'other': '-',
      },
    );
    return '$_temp0';
  }
}
