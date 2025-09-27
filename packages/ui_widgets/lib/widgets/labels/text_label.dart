import 'package:flutter/material.dart';
import 'package:ui_widgets/theme/gaps.dart';
import 'package:ui_widgets/theme/radius_values.dart';

class TextLabel extends StatelessWidget {
  const TextLabel({
    super.key,
    required this.text,
    this.backgroundColor,
    this.textScaler,
  });

  final String text;
  final Color? backgroundColor;
  final TextScaler? textScaler;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: backgroundColor ?? Theme.of(context).colorScheme.onSecondary,
          borderRadius:
              const BorderRadius.all(Radius.circular(RadiusValues.circular4))),
      padding: const EdgeInsets.symmetric(
          horizontal: Gaps.spacing4, vertical: Gaps.spacing2),
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Theme.of(context).colorScheme.surface,
              fontWeight: FontWeight.bold,
            ),
        textScaler: textScaler,
      ),
    );
  }
}
