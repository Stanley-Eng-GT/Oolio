import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_widgets/widgets/text/info_row.dart';

import '../../utils/app_wrapper.dart';

void main() {
  testWidgets('Renders InfoRow for bullet point description',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      getAppWrapper(
        child: const Scaffold(
          body: InfoRow(
            description: 'Description',
          ),
        ),
      ),
    );

    expect(find.byType(Text), findsNWidgets(2));
  });
}
