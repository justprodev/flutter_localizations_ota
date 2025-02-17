import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class L10nRu extends L10n {
  L10nRu([String locale = 'ru']) : super(locale);

  @override
  String get fl_ota_version => '1';

  @override
  String title(String package) {
    return 'Пример использования пакета \"$package\"';
  }

  @override
  String get currentLocaleTitle => 'Текущая локаль';

  @override
  String get remoteUpdateTitle => 'Удаленное обновление';

  @override
  String get testResource => 'Это локальное значение тестового ресурса';
}
