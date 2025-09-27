import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart' as pv;

import '../progress/loading_indicator/loading_indicator.dart';

class PhotoView extends StatelessWidget {
  const PhotoView({
    super.key,
    required this.imageProvider,
  });
  final ImageProvider imageProvider;

  @override
  Widget build(BuildContext context) {
    return pv.PhotoView(
      imageProvider: imageProvider,
      loadingBuilder: (context, progress) => const Center(
        child: LoadingIndicator(),
      ),
    );
  }
}
