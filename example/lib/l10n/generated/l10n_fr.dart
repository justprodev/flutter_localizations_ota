import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class L10nFr extends L10n {
  L10nFr([String locale = 'fr']) : super(locale);

  @override
  String get fl_ota_version => '1';

  @override
  String title(String package) {
    return 'Exemple d\'utilisation du package \" $package\"';
  }

  @override
  String get currentLocaleTitle => 'Paramètres régionaux actuels';

  @override
  String get remoteUpdateTitle => 'Mise à jour à distance';

  @override
  String get testResource => 'Il s\'agit de la valeur locale de la ressource de test';
}
