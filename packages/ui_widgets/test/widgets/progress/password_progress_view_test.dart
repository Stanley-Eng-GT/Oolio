import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foundation/utils/validators/password_validator.dart';
import 'package:ui_widgets/widgets/progress/password_progress/password_progress_view.dart';

import '../../utils/app_wrapper.dart';

void main() {
  testWidgets('Renders PasswordProgressView widgets',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      getAppWrapper(
          child: const Scaffold(
              body: PasswordProgressView(
        password: 'Test1234!',
        passwordValidator: PasswordValidator(),
      ))),
    );

    expect(find.byType(PasswordProgressCheckItemView), findsNWidgets(6));
  });
}
