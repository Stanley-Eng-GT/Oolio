import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_widgets/widgets/text_fields/email_password_view.dart';

import '../../utils/app_wrapper.dart';

void main() {
  testWidgets('Renders EmailPasswordView with correct format email',
      (WidgetTester tester) async {
    final formKey = GlobalKey<FormState>();
    await tester.pumpWidget(
      getAppWrapper(
          child: Scaffold(
              body: EmailPasswordView(
        formKey: formKey,
        emailController:
            TextEditingController(text: 'john.doe@safecode.com.au'),
        passwordController: TextEditingController(text: '12345'),
      ))),
    );

    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.byType(IconButton), findsOneWidget);
    expect(find.text('Email address'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);

    final res = formKey.currentState!.validate();
    expect(res, true);
  });

  testWidgets('Renders EmailPasswordView with incorrect format email',
      (WidgetTester tester) async {
    final formKey = GlobalKey<FormState>();
    await tester.pumpWidget(
      getAppWrapper(
          child: Scaffold(
              body: EmailPasswordView(
        formKey: formKey,
        emailController: TextEditingController(text: 'john.doe@safecode.com.'),
        passwordController: TextEditingController(text: '12345'),
      ))),
    );

    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.byType(IconButton), findsOneWidget);
    expect(find.text('Email address'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);

    final res = formKey.currentState!.validate();
    expect(res, false);
  });

  testWidgets('Renders EmailPasswordView with empty password',
      (WidgetTester tester) async {
    final formKey = GlobalKey<FormState>();
    await tester.pumpWidget(
      getAppWrapper(
          child: Scaffold(
              body: EmailPasswordView(
        formKey: formKey,
        emailController: TextEditingController(text: 'john.doe@safecode.com.'),
        passwordController: TextEditingController(text: ''),
      ))),
    );

    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.byType(IconButton), findsOneWidget);
    expect(find.text('Email address'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);

    final res = formKey.currentState!.validate();
    expect(res, false);
  });
}
