// Created by alex@justprodev.com on 17.02.2025.

import 'package:flutter_localizations_ota/flutter_localizations_ota.dart';
import 'package:flutter_localizations_ota/src/arb_worker/arb_parser.dart';
import 'package:flutter_localizations_ota/src/arb_worker/arb_worker.dart';

import 'util/isolate/isolate_stub.dart'
    if (dart.library.io) 'util/isolate/isolate_io.dart'
    if (dart.library.js_interop) 'util/isolate/isolate_web.dart';

import 'arb_store/arb_store_stub.dart'
    if (dart.library.io) 'arb_store/arb_store_io.dart'
    if (dart.library.js_interop) 'arb_store/arb_store_web.dart';

_VersionedArbWorker? _currentWorker;
ArbRequest? _currentRequest;
ArbRepository? _instance;

class ArbRepository {
  /// Create a new instance of ArbRepository
  ///
  /// [onLoad] - callback that will be called after the worker is loaded
  /// [onError] - callback that will be called if an error occurs during the worker loading
  ArbRepository.create(
    this._otaService, {
    required this.onLoad,
    required this.onError,
    ArbStore arbStore = const ArbStore(),
  }) : _arbStore = arbStore {
    _instance = this;
  }

  final Function(ArbRequest request, int newVersion) onLoad;
  final Function(ArbRequest request, Object error, StackTrace? trace)? onError;
  final OtaService _otaService;
  final ArbStore _arbStore;

  static ArbRepository get instance {
    if (_instance == null) {
      throw StateError('ArbRepository is not initialized. '
          'Perhaps you forgot to wrap your app with FlutterLocalizationsOta');
    }
    return _instance!;
  }

  ArbRequest? get currentRequest => _currentRequest;

  /// Get arb worker for the locale
  ///
  /// If the worker is already loaded and the version is the same, the cached worker will be returned.
  /// Otherwise, the worker will be loaded from the server, and the [onLoad] callback will be called.
  ///
  /// [localVersion] - version of the current localization file for the locale (fl_ota_version)
  ///
  /// [locale] - locale name, like en, en_US, etc.
  ArbWorker? getWorker(int localVersion, String locale) {
    if (_currentWorker != null &&
        _currentWorker!.localVersion == localVersion &&
        _currentWorker!.worker.locale == locale) {
      return _currentWorker!.worker;
    }

    final request = ArbRequest(localVersion, locale);

    // result will be cached in _currentWorker
    // onLoad will be called after the worker is loaded
    if (_currentRequest != request) _load(request);

    return null;
  }

  void _load(ArbRequest request) async {
    _currentRequest = request;

    try {
      final remoteVersion = await _otaService.getArbVersion(request.locale);

      // update the worker only if the remote version is greater than the local one
      if (remoteVersion > request.localVersion) {
        final worker = await _createWorker(request.locale, remoteVersion);
        _currentWorker = _VersionedArbWorker(worker, request.localVersion);
        if (_currentRequest?.locale == request.locale) onLoad(request, remoteVersion);
      }
    } catch (e, trace) {
      onError?.call(request, e, trace);
    }
  }

  Future<ArbWorker> _createWorker(String locale, int remoteVersion) async {
    final storeVersion = await _arbStore.getArbVersion(locale);
    final String arbContent;

    if (storeVersion == remoteVersion) {
      arbContent = await _arbStore.getArbContent(locale);
    } else {
      arbContent = await _otaService.getArbContent(locale);
      await _arbStore.putArb(locale, remoteVersion, arbContent);
    }

    final nodes = await run(() => parseArbContent(arbContent));
    return ArbWorker(nodes, locale);
  }
}

class _VersionedArbWorker {
  final ArbWorker worker;
  final int localVersion;

  const _VersionedArbWorker(this.worker, this.localVersion);
}

class ArbRequest {
  final int localVersion;
  final String locale;

  const ArbRequest(this.localVersion, this.locale);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ArbRequest && other.localVersion == localVersion && other.locale == locale;
  }

  @override
  int get hashCode => localVersion.hashCode ^ locale.hashCode;

  @override
  String toString() => 'ArbRequest(localVersion: $localVersion, locale: $locale)';
}
