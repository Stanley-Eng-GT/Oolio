import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_widgets/widgets/keyboards/pin_keyboard/widgets/pins_view.dart';

import '../../utils/app_wrapper.dart';

void main() {
  testWidgets('Renders pins view when filling 2 digits',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      getAppWrapper(
        child: const Scaffold(
          body: PinsView(
            totalPinCount: 4,
            filledPinCount: 2,
          ),
        ),
      ),
    );

    expect(find.byType(Icon), findsNWidgets(4));
    expect(find.byIcon(Icons.circle), findsNWidgets(2));
  });
}
