import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_widgets/widgets/text_fields/mobile_number_text_form_field.dart';

import '../../utils/app_wrapper.dart';

void main() {
  testWidgets('Renders MobileTextFormField with correct format mobile number',
      (WidgetTester tester) async {
    final formKey = GlobalKey<FormState>();
    await tester.pumpWidget(
      getAppWrapper(
          child: Scaffold(
              body: Form(
        key: formKey,
        child: MobileNumberTextFormField(
          controller: TextEditingController(text: '0450796766'),
        ),
      ))),
    );

    expect(find.byType(TextFormField), findsOneWidget);
    final res = formKey.currentState!.validate();
    expect(res, true);
  });

  testWidgets('Renders MobileTextFormField with incorrect format mobile number',
      (WidgetTester tester) async {
    final formKey = GlobalKey<FormState>();
    await tester.pumpWidget(
      getAppWrapper(
          child: Scaffold(
              body: Form(
        key: formKey,
        child: MobileNumberTextFormField(
          controller: TextEditingController(text: '450796761'),
        ),
      ))),
    );

    expect(find.byType(TextFormField), findsOneWidget);
    final res = formKey.currentState!.validate();
    expect(res, false);
  });
}
