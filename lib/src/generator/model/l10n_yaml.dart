// Created by alex@justprodev.com on 15.02.2025.

/// Represents the l10n.yaml file.
///
/// https://docs.flutter.dev/ui/accessibility-and-internationalization/internationalization#configuring-the-l10n-yaml-file
class L10nYaml {
  final dynamic _yaml;

  const L10nYaml(this._yaml);

  String get outputDir => _yaml['output-dir'];

  String get outputLocalizationFile => _yaml['output-localization-file'] ?? 'app_localizations.dart';

  String get outputClass => _yaml['output-class'] ?? 'AppLocalizations';

  String get templateArbFile => _yaml['template-arb-file'] ?? 'app_en.arb';
}
