import 'package:flutter/material.dart';
import 'package:ui_widgets/theme/gaps.dart';

import '../pin_keyboard_constants.dart';

class PinsView extends StatelessWidget {
  const PinsView({
    super.key,
    required this.totalPinCount,
    this.filledPinCount = 0,
  });

  final int totalPinCount;
  final int filledPinCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < totalPinCount; i++)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Gaps.spacing6),
            child: Icon(
              i < filledPinCount ? Icons.circle : Icons.circle_outlined,
              color: Theme.of(context).colorScheme.surface,
              size: PinKeyboardConstants.pinViewIconSize,
            ),
          ),
      ],
    );
  }
}
