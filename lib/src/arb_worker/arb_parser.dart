// Created by alex@justprodev.com on 13.02.2025.

import 'dart:convert';

import 'icu_parser/message_format.dart';
import 'icu_parser/parser.dart';

/// Parsed value of the line of the arb file
typedef Node = List<BaseElement>;

/// Parse the *.arb file content
Map<String, Node> parseArbContent(String content) {
  final icuParser = IcuParser();
  final Map<String, dynamic> arbJson = jsonDecode(content);
  final nodes = <String, Node>{};

  for (final entry in arbJson.entries) {
    if (entry.key.startsWith('@')) continue;
    final node = icuParser.parse(entry.value);
    if (node != null) nodes[entry.key] = node;
  }

  return nodes;
}
