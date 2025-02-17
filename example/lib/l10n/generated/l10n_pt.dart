import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class L10nPt extends L10n {
  L10nPt([String locale = 'pt']) : super(locale);

  @override
  String get fl_ota_version => '1';

  @override
  String title(String package) {
    return 'Exemplo de Utilização do pacote \" $package\"';
  }

  @override
  String get currentLocaleTitle => 'Localidade actual';

  @override
  String get remoteUpdateTitle => 'Actualização remota';

  @override
  String get testResource => 'Este é o valor local do recurso de teste';
}
