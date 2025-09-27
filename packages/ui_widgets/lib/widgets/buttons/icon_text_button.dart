import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_widgets/theme/gaps.dart';

class _IconTextButtonConstants {
  static const double iconSize = 20.0;
  static const double svgIconSize = 20.0;
}

class IconTextButton extends StatelessWidget {
  const IconTextButton({
    super.key,
    this.icon,
    this.svgPath,
    required this.label,
    this.color,
    this.padding,
    this.onTap,
  });
  final IconData? icon;
  final String? svgPath;
  final String label;
  final Color? color;
  final EdgeInsets? padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final foregroundColor = color ?? Theme.of(context).colorScheme.secondary;
    final leadingIcon = _leadingIcon(context: context, color: foregroundColor);
    return TextButton(
      onPressed: onTap,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(Gaps.spacing8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (leadingIcon != null)
              Padding(
                padding: const EdgeInsets.only(right: Gaps.spacing4),
                child: leadingIcon,
              ),
            Text(
              label,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: foregroundColor,
                  ),
            )
          ],
        ),
      ),
    );
  }

  Widget? _leadingIcon({
    required BuildContext context,
    required Color color,
  }) {
    if (icon != null) {
      return Icon(
        icon,
        color: color,
        size: _IconTextButtonConstants.iconSize,
      );
    } else if (svgPath?.isNotEmpty == true) {
      return SvgPicture.asset(
        svgPath!,
        colorFilter: ColorFilter.mode(
          color,
          BlendMode.srcIn,
        ),
        width: _IconTextButtonConstants.svgIconSize,
        height: _IconTextButtonConstants.svgIconSize,
      );
    } else {
      return null;
    }
  }
}
