import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:ui_widgets/theme/gaps.dart';
import 'package:ui_widgets/widgets/pinput_view/pinput_view_theme.dart';
import 'pinput_view_constants.dart';

class PinputView extends StatelessWidget {
  const PinputView({
    super.key,
    this.readOnly = false,
    this.errorMessage,
    this.controller,
    this.focusNode,
    this.isDarkMode = false,
    this.onCompleted,
  });
  final bool readOnly;
  final String? errorMessage;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool isDarkMode;
  final ValueChanged<String>? onCompleted;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Pinput(
          focusNode: focusNode,
          controller: controller,
          readOnly: readOnly,
          length: PinputViewConstants.pinLength,
          defaultPinTheme: isDarkMode
              ? PinputViewDarkTheme.defaultPinTheme
              : PinputViewLightTheme.defaultPinTheme,
          focusedPinTheme: isDarkMode
              ? PinputViewDarkTheme.focusedPinTheme
              : PinputViewLightTheme.focusedPinTheme,
          submittedPinTheme: isDarkMode
              ? PinputViewDarkTheme.submittedPinTheme
              : PinputViewLightTheme.submittedPinTheme,
          pinputAutovalidateMode: PinputAutovalidateMode.disabled,
          preFilledWidget: Text(
            PinputViewConstants.cellPlaceholder,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Theme.of(context).colorScheme.secondary),
          ),
          showCursor: false,
          onCompleted: onCompleted,
          autofocus: true,
        ),
        if (errorMessage?.isNotEmpty == true)
          Padding(
            padding: const EdgeInsets.only(top: Gaps.spacing8),
            child: Text(
              errorMessage!,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).colorScheme.error,
                    fontWeight: FontWeight.w500,
                  ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          )
      ],
    );
  }
}
