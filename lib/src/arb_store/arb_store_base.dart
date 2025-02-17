// Created by alex@justprodev.com on 12.11.2024.

import 'package:flutter_localizations_ota/src/ota_service.dart';

abstract class ArbStoreBase implements OtaService {
  const ArbStoreBase();

  Future<void> putArb(String localeName, int arbVersion, String arbContent);
}
