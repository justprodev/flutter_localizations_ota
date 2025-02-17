// Created by alex@justprodev.com on 14.02.2025.

import 'package:flutter/material.dart';
import 'package:flutter_localizations_ota/flutter_localizations_ota.dart';

import 'l10n/example_ota_service.dart';
import 'l10n/generated/l10n.dart';
import 'l10n/generated/l10n_remote.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? currentLocale;

  @override
  Widget build(BuildContext context) {
    return FlutterLocalizationsOta(
      otaService: const ExampleOtaService(),
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MyHomePage(onLocaleChange: (locale) => setState(() => currentLocale = locale)),
        localizationsDelegates: L10nRemote.localizationsDelegates,
        supportedLocales: L10nRemote.supportedLocales,
        locale: currentLocale,
      ),
      onError: (request, error, trace) {
        debugPrint(error.toString());
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  final Function(Locale?) onLocaleChange;

  const MyHomePage({super.key, required this.onLocaleChange});

  @override
  Widget build(BuildContext context) {
    final L = L10n.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(L.title('flutter_localizations_ota')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('fl_ota_version: ${L.fl_ota_version}'),
            const SizedBox(height: 12),
            Text('testResource: ${L.testResource}'),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('${L.currentLocaleTitle}:'),
                const SizedBox(width: 12),
                DropdownButton(
                  value: Locale(L.localeName),
                  items: L10n.supportedLocales
                      .map(
                        (locale) => DropdownMenuItem(value: locale, child: Text(locale.toString())),
                      )
                      .toList(),
                  onChanged: onLocaleChange,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
