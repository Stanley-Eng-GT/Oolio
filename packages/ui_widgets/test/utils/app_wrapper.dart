import 'package:flutter/material.dart';
import 'package:ui_widgets/generated/l10n.dart';

Widget getAppWrapper({required Widget child}) {
  return MaterialApp(
    localizationsDelegates: const [
      S.delegate,
    ],
    home: child,
  );
}
