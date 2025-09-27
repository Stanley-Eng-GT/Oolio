import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_widgets/widgets/text/file_upload_row.dart';

import '../../utils/app_wrapper.dart';

void main() {
  testWidgets('Renders FileUploadRow correctly', (WidgetTester tester) async {
    int counter = 0;
    await tester.pumpWidget(
      getAppWrapper(
        child: Scaffold(
          body: FileUploadRow(
            label: 'Add an image',
            onTap: () {
              counter++;
            },
          ),
        ),
      ),
    );

    expect(find.byType(ListTile), findsOneWidget);
    await tester.tap(find.byType(ListTile));
    await tester.pump();

    expect(counter, 1);
  });
}
