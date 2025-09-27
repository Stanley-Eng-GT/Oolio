import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_widgets/widgets/switches/toggle_button.dart';

import '../../utils/app_wrapper.dart';

void main() {
  testWidgets('Renders IconTextButton with no icon',
      (WidgetTester tester) async {
    bool value = false;
    await tester.pumpWidget(
      getAppWrapper(
        child: Scaffold(
          body: ToggleButton(
            value: false,
            onChanged: (val) {
              value = val;
            },
          ),
        ),
      ),
    );

    await tester.tap(find.byType(Switch));
    await tester.pump();

    expect(value, true);
  });
}
