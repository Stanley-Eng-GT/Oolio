import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_widgets/widgets/picker/select_date.dart';

import '../../utils/app_wrapper.dart';

void main() {
  testWidgets('call select date function and show date picker dialog',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      getAppWrapper(
        child: Scaffold(
          body: Builder(builder: (context) {
            return TextButton(
              onPressed: () => selectDate(
                  context: context,
                  lastSelectedDate: DateTime(1970),
                  onDateSelected: (date) {}),
              child: const Text('Date of birth'),
            );
          }),
        ),
      ),
    );

    await tester.tap(find.byType(TextButton));
    await tester.pump();

    expect(find.byType(CupertinoDatePicker), findsOneWidget);
  });
}
