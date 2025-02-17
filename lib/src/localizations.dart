// Created by alex@justprodev.com on 17.02.2025.

import 'package:flutter/widgets.dart';
import 'package:flutter_localizations_ota/flutter_localizations_ota.dart';
import 'package:flutter_localizations_ota/src/arb_repository.dart';

export 'package:flutter_localizations_ota/src/arb_repository.dart' show ArbRequest;

/// This widget is a wrapper for [MaterialApp] that allows you to use the [OtaService] to load translations from the server.
class FlutterLocalizationsOta extends StatefulWidget {
  /// Service for loading translations from the server.
  final OtaService otaService;

  /// Usually it's [MaterialApp]
  final Widget child;

  /// Callback that will be called when an error occurs while loading translations.
  final Function(ArbRequest request, Object error, StackTrace? stackTrace)? onError;

  const FlutterLocalizationsOta({
    super.key,
    required this.otaService,
    required this.child,
    this.onError,
  });

  @override
  State<FlutterLocalizationsOta> createState() => _FlutterLocalizationsOtaState();
}

class _FlutterLocalizationsOtaState extends State<FlutterLocalizationsOta> {
  late ArbRepository arbRepository;
  Key? key;

  @override
  void initState() {
    arbRepository = createArbRepository();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant FlutterLocalizationsOta oldWidget) {
    if (oldWidget.otaService != widget.otaService) {
      arbRepository = createArbRepository();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }

  ArbRepository createArbRepository() {
    return ArbRepository.create(
      widget.otaService,
      onError: widget.onError,
      onLoad: onLoad,
    );
  }

  void onLoad(ArbRequest request, int remoteVersion) {
    setState(() {
      key = Key('FlutterLocalizationsOta_${request.locale}_$remoteVersion');
    });
  }
}
