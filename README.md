Over-The-Air updates for [Flutter Framework localizations](https://github.com/flutter/flutter/tree/master/packages/flutter_localizations).

Features:

- **using l10n strings in standard way** as described in the [Internationalizing Flutter apps](https://docs.flutter.dev/ui/accessibility-and-internationalization/internationalization) tutorial.
- fetch updated ARB files from your backend by defining just one class `OtaService` with two methods.
- **caching** of the ARB files in the app's documents directory.
- **versioning** of the ARB files to prevent unnecessary downloads. (e.g. if local version is newer than the remote one, the download is skipped at all)

## Usage

### 1. l10n.yaml

Set `synthetic-package` to `false` in `l10n.yaml`. Example: 

```yaml
arb-dir: lib/l10n/arb
template-arb-file: app_en.arb
output-localization-file: l10n.dart
output-class: L10n

synthetic-package: false
output-dir: lib/l10n/generated

no-nullable-getter: true
```

[More](https://docs.flutter.dev/ui/accessibility-and-internationalization/internationalization#configuring-the-l10n-yaml-file)

### 2. Versioning

Define key `fl_ota_version` in ARB files. It is just number, which is increased at every change of the ARB files.

```json
{
  "fl_ota_version": "1"
} 
```

### 3. Generating files

1. `flutter gen-l10n` - Generate standard stubs.
2.  `dart run flutter_localizations_ota:generate` - Generate stub for Over-The-Air

### 4. Define `OtaService`

In a real scenario, some backend API needs to be used.

```dart
import 'dart:convert';

import 'package:flutter_localizations_ota/flutter_localizations_ota.dart';

const root = 'https://justprodev.com/partners/flutter_localizations_ota/arb';

class ExampleOtaService implements OtaService {
  const ExampleOtaService();

  @override
  Future<int> getArbVersion(String localeName) async {
    final r = await http.get(Uri.parse('$root/app_$localeName.version'));
    return int.parse(r.body);
  }

  @override
  Future<String> getArbContent(String localeName) async {
    final r = await http.get(Uri.parse('$root/app_$localeName.arb'));
    return utf8.decode(r.bodyBytes);
  }
}
```

### 5. Setup `App` for Over-The-Air updates

```dart
import 'l10n/example_ota_service.dart';
import 'l10n/generated/l10n_remote.dart';
```
```dart
    return FlutterLocalizationsOta(
      otaService: const ExampleOtaService(),
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MyHomePage(),
        localizationsDelegates: L10nRemote.localizationsDelegates,
        supportedLocales: L10nRemote.supportedLocales,
        locale: currentLocale,
      ),
      onError: (request, error, trace) {
        debugPrint(error.toString());
      },
    );
  }
```

### 6. Access translation anywhere in the app

```dart
import 'l10n/generated/l10n.dart';
```
```dart
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final L = L10n.of(context)!;

    return Text(L.helloWorld);
  }
}
```
##

Find `example` for more info.

[Example deployed to web](https://justprodev.com/partners/flutter_localizations_ota/web/)