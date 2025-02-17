import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class L10nJa extends L10n {
  L10nJa([String locale = 'ja']) : super(locale);

  @override
  String get fl_ota_version => '1';

  @override
  String title(String package) {
    return 'パッケージ\"$package\"の使用例';
  }

  @override
  String get currentLocaleTitle => '現在のロケール';

  @override
  String get remoteUpdateTitle => 'リモート更新';

  @override
  String get testResource => 'これはテストリソースのローカル値です';
}
