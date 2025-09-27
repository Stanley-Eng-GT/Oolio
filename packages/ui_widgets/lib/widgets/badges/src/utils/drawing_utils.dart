import 'package:flutter/material.dart';

import '../badge_gradient.dart';
import '../badge_shape.dart';
import '../painters/instagram_badge_shape_painter.dart';
import '../painters/twitter_badge_shape_painter.dart';

class DrawingUtils {
  static CustomPainter? drawBadgeShape({
    required BadgeShape shape,
    Color? color,
    BadgeGradient? badgeGradient,
    BadgeGradient? borderGradient,
    BorderSide? borderSide,
  }) {
    switch (shape) {
      case BadgeShape.twitter:
        return TwitterBadgeShapePainter(
          color: color,
          badgeGradient: badgeGradient,
          borderSide: borderSide,
          borderGradient: borderGradient,
        );
      case BadgeShape.instagram:
        return InstagramBadgeShapePainter(
          color: color,
          badgeGradient: badgeGradient,
          borderSide: borderSide,
          borderGradient: borderGradient,
        );
      case BadgeShape.square:
      case BadgeShape.circle:
        break;
    }
    return null;
  }
}
