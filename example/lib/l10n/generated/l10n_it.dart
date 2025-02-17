import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class L10nIt extends L10n {
  L10nIt([String locale = 'it']) : super(locale);

  @override
  String get fl_ota_version => '1';

  @override
  String title(String package) {
    return 'Esempio di utilizzo del pacchetto\"$package\"';
  }

  @override
  String get currentLocaleTitle => 'Locale corrente';

  @override
  String get remoteUpdateTitle => 'Aggiornamento remoto';

  @override
  String get testResource => 'Questo è il valore locale della risorsa di test';
}
