import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_widgets/widgets/text_fields/my_plus_text_form_field.dart';
import 'package:ui_widgets/widgets/text_fields/set_up_password_view.dart';

import '../../utils/app_wrapper.dart';

void main() {
  testWidgets('Renders SetUpPasswordView with correct format password',
      (WidgetTester tester) async {
    TextEditingController newPwdController =
        TextEditingController(text: '1234Asdf!');
    TextEditingController confirmPwdController =
        TextEditingController(text: '1234Asdf!');
    final formKey = GlobalKey<FormState>();

    await tester.pumpWidget(
      getAppWrapper(
          child: Scaffold(
              body: SetUpPasswordView(
                  formKey: formKey,
                  newPwdController: newPwdController,
                  confirmPwdController: confirmPwdController))),
    );
    final res = formKey.currentState!.validate();
    expect(res, true);
    expect(find.byType(MyPLUSTextFormField), findsNWidgets(2));
  });

  testWidgets('Renders SetUpPasswordView with uppercase error',
      (WidgetTester tester) async {
    TextEditingController newPwdController =
        TextEditingController(text: '1234asdf!');
    TextEditingController confirmPwdController =
        TextEditingController(text: '1234sdf!');
    final formKey = GlobalKey<FormState>();

    await tester.pumpWidget(
      getAppWrapper(
          child: Scaffold(
              body: SetUpPasswordView(
                  formKey: formKey,
                  newPwdController: newPwdController,
                  confirmPwdController: confirmPwdController))),
    );
    final res = formKey.currentState!.validate();
    expect(res, false);
  });

  testWidgets('Renders SetUpPasswordView with lowcase error',
      (WidgetTester tester) async {
    TextEditingController newPwdController =
        TextEditingController(text: '1234ASDF!');
    TextEditingController confirmPwdController =
        TextEditingController(text: '1234ASDF!');
    final formKey = GlobalKey<FormState>();

    await tester.pumpWidget(
      getAppWrapper(
          child: Scaffold(
              body: SetUpPasswordView(
                  formKey: formKey,
                  newPwdController: newPwdController,
                  confirmPwdController: confirmPwdController))),
    );
    final res = formKey.currentState!.validate();
    expect(res, false);
  });

  testWidgets('Renders SetUpPasswordView with number error',
      (WidgetTester tester) async {
    TextEditingController newPwdController =
        TextEditingController(text: 'AAAAASDF!');
    TextEditingController confirmPwdController =
        TextEditingController(text: 'AAAAASDF!');
    final formKey = GlobalKey<FormState>();

    await tester.pumpWidget(
      getAppWrapper(
          child: Scaffold(
              body: SetUpPasswordView(
                  formKey: formKey,
                  newPwdController: newPwdController,
                  confirmPwdController: confirmPwdController))),
    );
    final res = formKey.currentState!.validate();
    expect(res, false);
  });

  testWidgets('Renders SetUpPasswordView with special character error',
      (WidgetTester tester) async {
    TextEditingController newPwdController =
        TextEditingController(text: '1234Asdf');
    TextEditingController confirmPwdController =
        TextEditingController(text: '1234Asdf');
    final formKey = GlobalKey<FormState>();

    await tester.pumpWidget(
      getAppWrapper(
          child: Scaffold(
              body: SetUpPasswordView(
                  formKey: formKey,
                  newPwdController: newPwdController,
                  confirmPwdController: confirmPwdController))),
    );
    final res = formKey.currentState!.validate();
    expect(res, false);
  });

  testWidgets('Renders SetUpPasswordView with length error',
      (WidgetTester tester) async {
    TextEditingController newPwdController =
        TextEditingController(text: '1234Adf');
    TextEditingController confirmPwdController =
        TextEditingController(text: '1234Adf');
    final formKey = GlobalKey<FormState>();

    await tester.pumpWidget(
      getAppWrapper(
          child: Scaffold(
              body: SetUpPasswordView(
                  formKey: formKey,
                  newPwdController: newPwdController,
                  confirmPwdController: confirmPwdController))),
    );
    final res = formKey.currentState!.validate();
    expect(res, false);
  });
}
