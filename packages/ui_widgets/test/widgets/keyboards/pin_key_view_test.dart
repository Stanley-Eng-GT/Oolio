import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_widgets/widgets/keyboards/pin_keyboard/models/pin_key_model.dart';
import 'package:ui_widgets/widgets/keyboards/pin_keyboard/widgets/pin_key_view.dart';

import '../../utils/app_wrapper.dart';

void main() {
  testWidgets('Renders PinKeyView when model is for digit only',
      (WidgetTester tester) async {
    int counter = 0;
    await tester.pumpWidget(
      getAppWrapper(
        child: Scaffold(
          body: PinKeyView(
            pinKeyModel: const PinKeyModel.digitOnly(title: '1'),
            onTap: () => counter++,
          ),
        ),
      ),
    );

    final title = find.byType(Text);
    expect(title, findsOneWidget);

    await tester.tap(title);
    await tester.pump();
    expect(counter, 1);
  });

  testWidgets('Renders PinKeyView when model is for digit and chars',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      getAppWrapper(
        child: Scaffold(
          body: PinKeyView(
            pinKeyModel:
                const PinKeyModel.digitWithChars(title: '2', subtitle: 'abc'),
            onTap: () {},
          ),
        ),
      ),
    );

    expect(find.byType(Text), findsNWidgets(2));
  });

  testWidgets('Renders PinKeyView when model is for placeholder',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      getAppWrapper(
        child: Scaffold(
          body: PinKeyView(
            pinKeyModel: const PinKeyModel.placeholder(),
            onTap: () {},
          ),
        ),
      ),
    );

    expect(find.byType(Text), findsNothing);
  });

  testWidgets('Renders PinKeyView when model is delete',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      getAppWrapper(
        child: Scaffold(
          body: PinKeyView(
            pinKeyModel: const PinKeyModel.delete(),
            onTap: () {},
          ),
        ),
      ),
    );

    expect(find.byType(Icon), findsOneWidget);
  });
}
