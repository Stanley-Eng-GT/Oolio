import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_widgets/widgets/text_fields/my_plus_text_form_field.dart';

import '../../utils/app_wrapper.dart';

void main() {
  testWidgets('Renders OnboardingTextFormField correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      getAppWrapper(child: const Scaffold(body: MyPLUSTextFormField())),
    );

    expect(find.byType(TextFormField), findsOneWidget);
  });
}
