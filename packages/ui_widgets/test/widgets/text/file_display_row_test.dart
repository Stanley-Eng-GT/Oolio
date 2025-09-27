import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foundation/mime/mime.dart';
import 'package:ui_widgets/widgets/text/file_display_row.dart';

import '../../utils/app_wrapper.dart';

void main() {
  testWidgets('Renders FileUploadRow correctly', (WidgetTester tester) async {
    int fileNameCounter = 0;
    int deleteIconCounter = 0;
    await tester.pumpWidget(
      getAppWrapper(
        child: Scaffold(
          body: FileDisplayRow(
            fileName: 'image.png',
            fileType: FileType.image,
            onFileNameTap: () {
              fileNameCounter++;
            },
            onDeleteIconTap: () {
              deleteIconCounter++;
            },
          ),
        ),
      ),
    );

    expect(find.byType(TextButton), findsOneWidget);
    expect(find.byType(IconButton), findsOneWidget);

    await tester.tap(find.byType(TextButton));
    await tester.pump();
    expect(fileNameCounter, 1);

    await tester.tap(find.byType(IconButton));
    await tester.pump();
    expect(deleteIconCounter, 1);
  });
}
