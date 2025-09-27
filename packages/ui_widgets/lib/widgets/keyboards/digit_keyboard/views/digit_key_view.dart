import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_widgets/theme/gaps.dart';
import 'package:ui_widgets/theme/radius_values.dart';

import '../digit_keyboard_constants.dart';
import '../models/digit_key_model.dart';

const double _dotIconSize = 5.0;

class DigitKeyView extends StatelessWidget {
  const DigitKeyView({
    super.key,
    required this.digitKeyModel,
    this.onTap,
  });

  final DigitKeyModel digitKeyModel;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    const transparentColor = Colors.transparent;
    return Card(
      color: digitKeyModel.maybeMap(
          dot: (_) => transparentColor,
          delete: (_) => transparentColor,
          orElse: () => null),
      shape: const RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(RadiusValues.circular4))),
      child: TextButton(
        onPressed: onTap,
        child: digitKeyModel.when(
          digitOnly: (title) => DigitKeyDigitAndCharsView(title: title),
          digitWithChars: (title, subtitle) => DigitKeyDigitAndCharsView(
            title: title,
            subtitle: subtitle,
          ),
          dot: () => Icon(
            CupertinoIcons.circle_fill,
            color: Theme.of(context).colorScheme.secondary,
            size: _dotIconSize,
          ),
          delete: () => Icon(
            CupertinoIcons.delete_left,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}

class DigitKeyDigitAndCharsView extends StatelessWidget {
  const DigitKeyDigitAndCharsView({
    super.key,
    required this.title,
    this.subtitle,
  });
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.w500,
                height: DigitKeyboardConstants.textHeight,
              ),
        ),
        if (subtitle != null)
          Padding(
            padding: const EdgeInsets.only(top: Gaps.spacing4),
            child: Text(
              subtitle!,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.w500,
                    height: DigitKeyboardConstants.textHeight,
                    letterSpacing: DigitKeyboardConstants.letterSpacing,
                  ),
            ),
          ),
      ],
    );
  }
}
