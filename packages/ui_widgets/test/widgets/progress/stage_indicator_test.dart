import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_widgets/widgets/progress/stage_indicator/stage_indicator.dart';
import 'package:ui_widgets/widgets/progress/stage_indicator/stage_indicator_item.dart';
import 'package:ui_widgets/widgets/progress/stage_indicator/stage_indicator_status.dart';

import '../../utils/app_wrapper.dart';

void main() {
  testWidgets('Renders StageIndicator widgets', (WidgetTester tester) async {
    await tester.pumpWidget(
      getAppWrapper(
        child: const Scaffold(
          body: StageIndicator(
            currentState: StageIndicatorStatus.selected,
            currentIndex: 1,
            totalLength: 3,
          ),
        ),
      ),
    );

    expect(find.byType(StageIndicatorItem), findsNWidgets(3));
    expect(find.byType(Icon), findsOneWidget);
  });
}
