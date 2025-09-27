import 'package:flutter/material.dart';
import 'package:ui_widgets/widgets/progress/loading_indicator/loading_indicator.dart';

import '../../theme/gaps.dart';

class CTAConfirmButtonConstants {
  static const double secondaryButtonBackgroundOpacity = 0.5;
}

class CTAConfirmButton extends StatelessWidget {
  const CTAConfirmButton({
    super.key,
    required this.label,
    this.onPressed,
    this.readOnly = false,
    this.loading = false,
    this.buttonStyle,
    this.textStyle,
    this.prefix,
    this.textScaler,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool readOnly;
  final bool loading;
  final ButtonStyle? buttonStyle;
  final TextStyle? textStyle;
  final Widget? prefix;
  final TextScaler? textScaler;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: buttonStyle,
      onPressed: (readOnly || onPressed == null)
          ? null
          : () {
              if (loading == false) {
                onPressed?.call();
              }
            },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: loading
            ? [LoadingIndicator(color: Theme.of(context).colorScheme.surface)]
            : [
                if (prefix != null)
                  Padding(
                    padding: const EdgeInsets.only(right: Gaps.spacing4),
                    child: prefix!,
                  ),
                Expanded(
                  child: Text(
                    label,
                    style: textStyle ??
                        Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: Theme.of(context).colorScheme.surface,
                              fontWeight: FontWeight.bold,
                            ),
                    textScaler: textScaler,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
      ),
    );
  }
}
