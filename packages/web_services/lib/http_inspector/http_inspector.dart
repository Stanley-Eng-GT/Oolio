import 'package:flutter/material.dart';

import 'alice/alice.dart';
import 'alice/core/alice_dio_interceptor.dart';

class HttpInspector {
  final Alice _alice;

  HttpInspector({
    Alice? alice,
    bool showNotification = false,
    GlobalKey<NavigatorState>? navigatorKey,
  }) : _alice = alice ??
            Alice(
              navigatorKey: navigatorKey,
            );

  AliceDioInterceptor getDioInterceptor() => _alice.getDioInterceptor();

  void showInspector() => _alice.showInspector();
}
