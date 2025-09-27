import 'package:flutter/material.dart';

import '../../theme/gaps.dart';

class CTAOutlinedButton extends StatelessWidget {
  const CTAOutlinedButton({
    super.key,
    required this.label,
    this.onPressed,
    this.readOnly = false,
    this.buttonStyle,
    this.textStyle,
    this.mainAxisSize = MainAxisSize.max,
    this.prefix,
  });
  final String label;
  final VoidCallback? onPressed;
  final bool readOnly;
  final ButtonStyle? buttonStyle;
  final TextStyle? textStyle;
  final MainAxisSize mainAxisSize;
  final Widget? prefix;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: buttonStyle,
      onPressed: readOnly ? null : onPressed,
      child: Row(
        mainAxisSize: mainAxisSize,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (prefix != null)
            Padding(
              padding: const EdgeInsets.only(right: Gaps.spacing4),
              child: prefix!,
            ),
          Expanded(
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: textStyle ??
                  Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
            ),
          ),
        ],
      ),
    );
  }
}
