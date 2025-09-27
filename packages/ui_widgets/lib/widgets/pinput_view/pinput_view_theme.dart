import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:ui_widgets/theme/my_plus_colors.dart';
import 'package:ui_widgets/widgets/pinput_view/pinput_view_constants.dart';

class PinputViewLightTheme {
  static PinTheme defaultPinTheme = PinTheme(
    width: PinputViewConstants.cellWidth,
    height: PinputViewConstants.cellHeight,
    textStyle: const TextStyle(
        fontSize: PinputViewConstants.fontSize, color: MyPLUSColor.darkGray),
    decoration: BoxDecoration(
      border: Border.all(
          color: MyPLUSColor.darkGray, width: PinputViewConstants.borderWidth),
      borderRadius:
          BorderRadius.circular(PinputViewConstants.borderRadiusValue),
    ),
  );

  static PinTheme focusedPinTheme = defaultPinTheme.copyDecorationWith(
    border: Border.all(
        color: MyPLUSColor.primary, width: PinputViewConstants.borderWidth),
    borderRadius: BorderRadius.circular(PinputViewConstants.borderRadiusValue),
  );

  static PinTheme submittedPinTheme = defaultPinTheme.copyWith(
    decoration: defaultPinTheme.decoration?.copyWith(
      color: MyPLUSColor.lightGray.withValues(alpha: 0.1),
    ),
  );
}

class PinputViewDarkTheme {
  static PinTheme defaultPinTheme = PinTheme(
    width: PinputViewConstants.cellWidth,
    height: PinputViewConstants.cellHeight,
    textStyle: const TextStyle(
        fontSize: PinputViewConstants.fontSize, color: MyPLUSColor.canvas),
    decoration: BoxDecoration(
      border: Border.all(
          color: MyPLUSColor.lightGray, width: PinputViewConstants.borderWidth),
      borderRadius:
          BorderRadius.circular(PinputViewConstants.borderRadiusValue),
    ),
  );

  static PinTheme focusedPinTheme = defaultPinTheme.copyDecorationWith(
    border: Border.all(
        color: MyPLUSColor.primaryDark, width: PinputViewConstants.borderWidth),
    borderRadius: BorderRadius.circular(PinputViewConstants.borderRadiusValue),
  );

  static PinTheme submittedPinTheme = defaultPinTheme.copyWith(
    decoration: defaultPinTheme.decoration?.copyWith(
      color: MyPLUSColor.canvas.withValues(alpha: 0.1),
    ),
  );
}
