import 'package:flutter/material.dart';

class CircleShapeIcon extends StatelessWidget {
  const CircleShapeIcon({
    super.key,
    required this.icon,
    this.isFilled = false,
    this.borderColor,
    this.iconColor,
    this.borderSize,
    this.iconSize,
    this.borderWidth = 4.0,
  });
  final IconData icon;
  final bool isFilled;
  final Color? borderColor;
  final Color? iconColor;
  final double? borderSize;
  final double? iconSize;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: borderSize,
      height: borderSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor ??
              Theme.of(context).colorScheme.secondary, // Border color
          width: borderWidth, // Border width
        ),
        color: isFilled ? borderColor : Colors.transparent, // Background color
      ),
      child: Center(
        child: Icon(
          icon,
          size: iconSize,
          color: iconColor,
        ),
      ),
    );
  }
}
