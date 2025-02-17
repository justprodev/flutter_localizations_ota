import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class L10nEs extends L10n {
  L10nEs([String locale = 'es']) : super(locale);

  @override
  String get fl_ota_version => '1';

  @override
  String title(String package) {
    return 'Ejemplo de uso del paquete \" $package\"';
  }

  @override
  String get currentLocaleTitle => 'Configuración regional actual';

  @override
  String get remoteUpdateTitle => 'Actualización remota';

  @override
  String get testResource => 'Este es el valor local del recurso de prueba';
}
