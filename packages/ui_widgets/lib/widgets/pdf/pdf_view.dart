import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foundation/mime/mime.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfView extends StatelessWidget {
  const PdfView({
    super.key,
    required this.path,
    required this.sourceType,
  });
  final String path;
  final FileSourceType sourceType;

  @override
  Widget build(BuildContext context) {
    final Widget body;
    switch (sourceType) {
      case FileSourceType.local:
        body = SfPdfViewer.file(
          File(path),
          canShowPaginationDialog: false,
          canShowScrollHead: false,
        );
      case FileSourceType.network:
        body = SfPdfViewer.network(
          path,
          canShowPaginationDialog: false,
          canShowScrollHead: false,
        );
      case FileSourceType.assets:
        body = SfPdfViewer.asset(
          path,
          canShowPaginationDialog: false,
          canShowScrollHead: false,
        );
    }
    return SfTheme(
      data: SfThemeData(
        pdfViewerThemeData: SfPdfViewerThemeData(
          progressBarColor: Theme.of(context).colorScheme.primary,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
      child: body,
    );
  }
}
