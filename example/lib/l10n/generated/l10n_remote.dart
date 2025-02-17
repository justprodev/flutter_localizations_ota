import 'l10n.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// ignore_for_file: type=lint

import 'package:flutter_localizations_ota/src/arb_worker/arb_worker.dart';
import 'package:flutter_localizations_ota/src/arb_repository.dart';

/// Remote wrapper for the L10n class, that extract labels directly from ARB files if they are present.
class L10nRemote extends L10n {
  L10nRemote(this.base, this._arb) : super(base.localeName);
  
  final L10n base;
  final ArbWorker _arb;
  
  static const LocalizationsDelegate<L10n> delegate = _L10nDelegateWithOta(L10n.delegate);
  
  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];
  
  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = L10n.supportedLocales;

  /// No description provided for @fl_ota_version.
  ///
  /// In en, this message translates to:
  /// **'1'**
	String get fl_ota_version => _arb.get('fl_ota_version') ?? base.fl_ota_version;

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Example of using of the package \"{package}\"'**
	String title(String package) => _arb.get('title', {'package': package}) ?? base.title(package);

  /// No description provided for @currentLocaleTitle.
  ///
  /// In en, this message translates to:
  /// **'Current locale'**
	String get currentLocaleTitle => _arb.get('currentLocaleTitle') ?? base.currentLocaleTitle;

  /// No description provided for @remoteUpdateTitle.
  ///
  /// In en, this message translates to:
  /// **'Remote update'**
	String get remoteUpdateTitle => _arb.get('remoteUpdateTitle') ?? base.remoteUpdateTitle;

  /// No description provided for @testResource.
  ///
  /// In en, this message translates to:
  /// **'This is local value of the test resource'**
	String get testResource => _arb.get('testResource') ?? base.testResource;
}

class _L10nDelegateWithOta extends LocalizationsDelegate<L10n> {
  const _L10nDelegateWithOta(this.baseDelegate);

  final LocalizationsDelegate<L10n> baseDelegate;

  @override
  Future<L10n> load(Locale locale) {
    return baseDelegate.load(locale).then((base) {
      final worker = ArbRepository.instance.getWorker(int.parse(base.fl_ota_version), base.localeName);
      return worker != null ? L10nRemote(base, worker) : base;
    });
  }

  @override
  bool isSupported(Locale locale) => baseDelegate.isSupported(locale);

  @override
  bool shouldReload(_L10nDelegateWithOta old) => false;
}
