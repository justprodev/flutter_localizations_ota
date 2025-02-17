// Created by alex@justprodev.com on 13.02.2025.

import 'package:intl/intl.dart';

import 'arb_parser.dart';
import 'icu_parser/message_format.dart';

/// Simple implementation of the ARB localization resolver.
class ArbWorker {
  ArbWorker(this._arbNodes, this.locale);

  final String locale;
  final Map<String, Node> _arbNodes;
  Map<String, dynamic> _args = const {};

  /// Get the translation for the given key
  ///
  /// [args] - The arguments to pass to the translation.
  /// like {name: 'Nico'} equivalent to `AppLocalizations.of(context).key('Nico')` for the case if `name`
  /// is first placeholder.
  String? get(String key, [Map<String, dynamic> args = const {}]) {
    final node = _arbNodes[key];

    if (node == null) return null;

    _args = args;

    final s = node.map(_parseElementToString).join('');

    return s.isNotEmpty ? s : null;
  }

  String _parseElementToString(BaseElement element) {
    switch (element.type) {
      case ElementType.literal:
        return element.value;
      case ElementType.plural:
        if (_args.isEmpty) return '';
        final options = (element as PluralElement).options;
        String? zeroStr, oneStr, twoStr, fewStr, manyStr, otherStr;

        for (var option in options) {
          switch (option.name) {
            case 'zero':
            case '=0':
              zeroStr = option.value.map(_parseElementToString).join('');
            case 'one':
            case '=1':
              oneStr = option.value.map(_parseElementToString).join('');
            case 'two':
            case '=2':
              twoStr = option.value.map(_parseElementToString).join('');
            case 'few':
              fewStr = option.value.map(_parseElementToString).join('');
            case 'many':
              manyStr = option.value.map(_parseElementToString).join('');
            case 'other':
              otherStr = option.value.map(_parseElementToString).join('');
          }
        }

        return Intl.plural(_args[element.value],
            locale: locale, zero: zeroStr, two: twoStr, one: oneStr, few: fewStr, other: otherStr ?? '', many: manyStr);
      case ElementType.gender:
        if (_args.isEmpty) return '';
        final options = (element as GenderElement).options;
        String? otherStr, maleStr, femaleStr;

        for (var option in options) {
          switch (option.name) {
            case 'other':
              otherStr = option.value.map(_parseElementToString).join('');
            case 'male':
              maleStr = option.value.map(_parseElementToString).join('');
            case 'female':
              femaleStr = option.value.map(_parseElementToString).join('');
          }
        }

        return Intl.gender(_args[element.value],
            locale: locale, other: otherStr ?? '', female: femaleStr, male: maleStr);
      case ElementType.argument:
        if (_args.isEmpty) return '';
        return _args[element.value].toString();
      case ElementType.select:
        if (_args.isEmpty) return '';
        final options = (element as SelectElement).options;
        final cases = <Object, String>{
          for (final option in options) option.name: option.value.first.value,
        };

        return Intl.select(_args[element.value], cases, locale: locale);
    }
  }
}
