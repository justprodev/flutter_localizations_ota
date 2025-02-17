// Created by alex@justprodev.com on 15.02.2025.

const header = '''
import '@(baseClassFile)';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// ignore_for_file: type=lint

import 'package:flutter_localizations_ota/src/arb_worker/arb_worker.dart';
import 'package:flutter_localizations_ota/src/arb_repository.dart';

/// Remote wrapper for the @(baseClass) class, that extract labels directly from ARB files if they are present.
class @(baseClass)Remote extends @(baseClass) {
  @(baseClass)Remote(this.base, this._arb) : super(base.localeName);
  
  final @(baseClass) base;
  final ArbWorker _arb;
  
  static const LocalizationsDelegate<@(baseClass)> delegate = _L10nDelegateWithOta(L10n.delegate);
  
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
  static const List<Locale> supportedLocales = @(baseClass).supportedLocales;
''';


const footer = '''
class _@(baseClass)DelegateWithOta extends LocalizationsDelegate<@(baseClass)> {
  const _@(baseClass)DelegateWithOta(this.baseDelegate);

  final LocalizationsDelegate<@(baseClass)> baseDelegate;

  @override
  Future<@(baseClass)> load(Locale locale) {
    return baseDelegate.load(locale).then((base) {
      final worker = ArbRepository.instance.getWorker(int.parse(base.fl_ota_version), base.localeName);
      return worker != null ? @(baseClass)Remote(base, worker) : base;
    });
  }

  @override
  bool isSupported(Locale locale) => baseDelegate.isSupported(locale);

  @override
  bool shouldReload(_@(baseClass)DelegateWithOta old) => false;
}
''';