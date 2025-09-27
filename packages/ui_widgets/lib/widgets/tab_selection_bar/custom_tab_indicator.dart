import 'package:flutter/material.dart';

class CustomTabIndicator extends Decoration {
  /// Create an underline style selected tab indicator.
  const CustomTabIndicator({
    this.borderRadius,
    this.borderSide = const BorderSide(width: 2.0, color: Colors.white),
    this.insets = EdgeInsets.zero,
    this.indicatorPosition = CustomTabIndicatorPosition.bottom,
  });

  final BorderRadius? borderRadius;
  final BorderSide borderSide;
  final EdgeInsetsGeometry insets;
  final CustomTabIndicatorPosition indicatorPosition;

  @override
  Decoration? lerpFrom(Decoration? a, double t) {
    if (a is CustomTabIndicator) {
      return CustomTabIndicator(
        borderSide: BorderSide.lerp(a.borderSide, borderSide, t),
        insets: EdgeInsetsGeometry.lerp(a.insets, insets, t)!,
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  Decoration? lerpTo(Decoration? b, double t) {
    if (b is CustomTabIndicator) {
      return CustomTabIndicator(
        borderSide: BorderSide.lerp(borderSide, b.borderSide, t),
        insets: EdgeInsetsGeometry.lerp(insets, b.insets, t)!,
      );
    }
    return super.lerpTo(b, t);
  }

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomPainter(
        indicatorPosition: indicatorPosition,
        decoration: this,
        borderSide: borderSide,
        borderRadius: borderRadius,
        onChanged: onChanged);
  }

  Rect _indicatorRectFor(Rect rect, TextDirection textDirection) {
    final Rect indicator = insets.resolve(textDirection).deflateRect(rect);
    return Rect.fromLTWH(
      indicator.left,
      indicator.bottom - borderSide.width,
      indicator.width,
      borderSide.width,
    );
  }

  @override
  Path getClipPath(Rect rect, TextDirection textDirection) {
    if (borderRadius != null) {
      return Path()
        ..addRRect(
            borderRadius!.toRRect(_indicatorRectFor(rect, textDirection)));
    }
    return Path()..addRect(_indicatorRectFor(rect, textDirection));
  }
}

enum CustomTabIndicatorPosition {
  top,
  bottom,
}

class _CustomPainter extends BoxPainter {
  _CustomPainter({
    required this.indicatorPosition,
    required this.decoration,
    required this.borderSide,
    this.borderRadius,
    VoidCallback? onChanged,
  }) : super(onChanged);

  final CustomTabIndicatorPosition indicatorPosition;
  final CustomTabIndicator decoration;
  final BorderRadius? borderRadius;
  final BorderSide borderSide;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);
    final Size size;
    switch (indicatorPosition) {
      case CustomTabIndicatorPosition.top:
        size = Size(configuration.size!.width, borderSide.width);
      default:
        size = configuration.size!;
    }
    final Rect rect = offset & size;
    final TextDirection textDirection = configuration.textDirection!;
    final Paint paint;
    if (borderRadius != null) {
      paint = Paint()..color = decoration.borderSide.color;
      Rect indicator = decoration._indicatorRectFor(rect, textDirection);
      final RRect rrect = RRect.fromRectAndCorners(
        indicator,
        topLeft: borderRadius!.topLeft,
        topRight: borderRadius!.topRight,
        bottomRight: borderRadius!.bottomRight,
        bottomLeft: borderRadius!.bottomLeft,
      );
      canvas.drawRRect(rrect, paint);
    } else {
      paint = decoration.borderSide.toPaint()..strokeCap = StrokeCap.square;
      final Rect indicator = decoration
          ._indicatorRectFor(rect, textDirection)
          .deflate(decoration.borderSide.width / 2.0);
      canvas.drawLine(indicator.bottomLeft, indicator.bottomRight, paint);
    }
  }
}
