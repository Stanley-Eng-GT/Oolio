import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_widgets/widgets/text/color_select_row.dart';

import '../../utils/app_wrapper.dart';

void main() {
  testWidgets('Renders ColorSelectRow correctly', (WidgetTester tester) async {
    int counter = 0;
    await tester.pumpWidget(
      getAppWrapper(
        child: Scaffold(
          body: ColorSelectRow(
            onTap: () {
              counter++;
            },
          ),
        ),
      ),
    );

    expect(find.byType(Text), findsOneWidget);
    await tester.tap(find.byType(Text));
    await tester.pump();

    expect(counter, 1);
  });
}
