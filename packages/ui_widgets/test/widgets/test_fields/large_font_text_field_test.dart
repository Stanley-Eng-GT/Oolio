import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_widgets/widgets/text_fields/large_font_text_field.dart';

import '../../utils/app_wrapper.dart';

void main() {
  testWidgets('Renders LargeFontTextField with initial value',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      getAppWrapper(
        child: Scaffold(
          body: LargeFontTextField(
            initialValue: '1',
            focusNode: FocusNode(),
          ),
        ),
      ),
    );

    expect(find.byType(TextFormField), findsOneWidget);
  });
}
