import 'package:flutter/material.dart';

import '../../theme/gaps.dart';
import '../../theme/radius_values.dart';

class _AlertBannerConstants {
  static const double backgroundColorOpacity = 0.1;
  static const double borderWidth = 1.0;
}

class AlertBanner extends StatelessWidget {
  const AlertBanner({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Gaps.spacing16),
      decoration: BoxDecoration(
          color: Theme.of(context)
              .colorScheme
              .error
              .withValues(alpha: _AlertBannerConstants.backgroundColorOpacity),
          border: Border.all(
            color: Theme.of(context).colorScheme.error,
            width: _AlertBannerConstants.borderWidth,
          ),
          borderRadius:
              const BorderRadius.all(Radius.circular(RadiusValues.circular10))),
      child: child,
    );
  }
}
