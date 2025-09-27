import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_widgets/widgets/keyboards/pin_keyboard/models/pin_key_model.dart';
import 'package:ui_widgets/widgets/keyboards/pin_keyboard/pin_keyboard_constants.dart';
import 'package:ui_widgets/widgets/keyboards/pin_keyboard/pin_keyboard_view.dart';
import 'package:ui_widgets/widgets/keyboards/pin_keyboard/widgets/pin_key_view.dart';

import '../../utils/app_wrapper.dart';

void main() {
  testWidgets('Renders PinKeyboardView widgets', (WidgetTester tester) async {
    PinKeyModel? keyModel;
    await tester.pumpWidget(
      getAppWrapper(
        child: Scaffold(
          body: SingleChildScrollView(
            child: PinKeyboardView(
              onKeyTap: (key) {
                keyModel = key;
              },
            ),
          ),
        ),
      ),
    );

    expect(find.byType(PinKeyView),
        findsNWidgets(PinKeyboardConstants.keys.length - 1));

    await tester.tap(find.text('1'));
    await tester.pump();
    expect(
        keyModel, const PinKeyModel.digitWithChars(title: '1', subtitle: ''));
  });
}
