#!/bin/sh

# auto-translate
# define cloud keys in `dev_assets/flutter_arb_translator_config.json` - https://pub.dev/packages/flutter_arb_translator#guide
# dart run flutter_arb_translator:main --dir lib/l10n/arb --from en --to es --to fr --to de --to it --to ja --to ko --to pt --to ru --service yandex

flutter.bat gen-l10n && dart run flutter_localizations_ota:generate
