import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class L10nEn extends L10n {
  L10nEn([String locale = 'en']) : super(locale);

  @override
  String get fl_ota_version => '1';

  @override
  String title(String package) {
    return 'Example of using of the package \"$package\"';
  }

  @override
  String get currentLocaleTitle => 'Current locale';

  @override
  String get remoteUpdateTitle => 'Remote update';

  @override
  String get testResource => 'This is local value of the test resource';
}
