import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_widgets/theme/gaps.dart';
import 'package:ui_widgets/theme/my_plus_colors.dart';
import 'package:ui_widgets/widgets/keyboards/pin_keyboard/models/pin_key_model.dart';
import 'package:ui_widgets/widgets/keyboards/pin_keyboard/pin_keyboard_constants.dart';

class PinKeyView extends StatelessWidget {
  const PinKeyView({
    super.key,
    required this.pinKeyModel,
    this.onTap,
  });

  final PinKeyModel pinKeyModel;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: PinKeyboardConstants.pinViewFilterSigmaValue,
            sigmaY: PinKeyboardConstants.pinViewFilterSigmaValue,
          ),
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: MyPLUSColor.secondary3,
            ),
            child: TextButton(
              style: Theme.of(context).textButtonTheme.style?.copyWith(
                  shape: WidgetStateProperty.all<CircleBorder>(
                      const CircleBorder())),
              onPressed: onTap,
              child: LayoutBuilder(builder: (context, constraint) {
                return Container(
                  alignment: Alignment.center,
                  width: constraint.maxWidth,
                  height: constraint.maxHeight,
                  child: pinKeyModel.when(
                    digitOnly: (title) => PinKeyDigitAndCharsView(title: title),
                    digitWithChars: (title, subtitle) =>
                        PinKeyDigitAndCharsView(
                      title: title,
                      subtitle: subtitle,
                    ),
                    placeholder: () => const SizedBox.shrink(),
                    delete: () => Icon(
                      CupertinoIcons.delete_left,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

class PinKeyDigitAndCharsView extends StatelessWidget {
  const PinKeyDigitAndCharsView({
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
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Theme.of(context).colorScheme.surface,
                fontWeight: FontWeight.w500,
                height: PinKeyboardConstants.textHeight,
              ),
        ),
        if (subtitle != null)
          Padding(
            padding: const EdgeInsets.only(top: Gaps.spacing4),
            child: Text(
              subtitle!,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Theme.of(context).colorScheme.surface,
                    height: PinKeyboardConstants.textHeight,
                  ),
            ),
          ),
      ],
    );
  }
}
