import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foundation/mime/mime.dart';
import 'package:ui_widgets/theme/radius_values.dart';
import 'package:ui_widgets/widgets/videos/video_view.dart';

import '../icons/circle_shape_icon.dart';

class _ImageTileConstants {
  static const double closeButtonOuterIconSize = 24.0;
  static const double closeButtonInnerIconSize = 16.0;
  static const double topPadding = 8.0;
  static const double rightPadding = 8.0;
}

class ImageTile extends StatelessWidget {
  final String filePath;
  final VoidCallback onDelete;

  const ImageTile({
    super.key,
    required this.filePath,
    required this.onDelete,
    required this.size,
  });
  final double size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: _ImageTileConstants.topPadding,
            right: _ImageTileConstants.rightPadding,
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
                Radius.circular(RadiusValues.circular10)),
            child: _getImageContent(context),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: onDelete,
            icon: CircleShapeIcon(
              icon: Icons.close,
              borderColor: Theme.of(context).colorScheme.secondary,
              iconColor: Theme.of(context).canvasColor,
              borderSize: _ImageTileConstants.closeButtonOuterIconSize,
              iconSize: _ImageTileConstants.closeButtonInnerIconSize,
              isFilled: true,
            ),
          ),
        ),
      ],
    );
  }

  double get _imageWidth => size - _ImageTileConstants.rightPadding;
  double get _imageHeight => size - _ImageTileConstants.topPadding;

  Widget _getImageContent(BuildContext context) {
    final fileType = lookupMimeType(filePath);
    if (fileType == FileType.image) {
      return Image.file(
        File(filePath),
        width: _imageWidth,
        height: _imageHeight,
        fit: BoxFit.cover,
      );
    } else if (fileType == FileType.video) {
      return SizedBox(
        width: _imageWidth,
        height: _imageHeight,
        child: VideoView(
          filePath: filePath,
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
