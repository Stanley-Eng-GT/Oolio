import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImageView extends StatelessWidget {
  const CachedImageView(
      {super.key,
      required this.imageUrl,
      this.width,
      this.height,
      this.fit = BoxFit.cover});
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator.adaptive()),
      errorWidget: (context, url, error) => Icon(
        Icons.broken_image_outlined,
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
