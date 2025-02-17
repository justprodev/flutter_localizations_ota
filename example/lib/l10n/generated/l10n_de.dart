import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class L10nDe extends L10n {
  L10nDe([String locale = 'de']) : super(locale);

  @override
  String get fl_ota_version => '1';

  @override
  String title(String package) {
    return 'Beispiel für die Verwendung des Pakets \"$package\"';
  }

  @override
  String get currentLocaleTitle => 'Aktuelles Gebietsschema';

  @override
  String get remoteUpdateTitle => 'Fernaktualisierung';

  @override
  String get testResource => 'Dies ist der lokale Wert der Testressource';
}
