// Created by alex@justprodev.com on 17.02.2025.

import 'dart:convert';

import 'package:flutter_localizations_ota/flutter_localizations_ota.dart';
import 'package:http/http.dart' as http;

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