import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ToggleButton extends StatelessWidget {
  const ToggleButton({
    super.key,
    this.value = false,
    this.scale = 0.75,
    this.alignment = Alignment.center,
    this.materialTapTargetSize,
    this.onChanged,
  });

  final bool value;
  final double scale;
  final AlignmentGeometry? alignment;
  final MaterialTapTargetSize? materialTapTargetSize;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      alignment: alignment,
      scale: scale,
      child: Platform.isIOS
          ? CupertinoSwitch(
              activeTrackColor: Theme.of(context).primaryColor,
              inactiveTrackColor: Theme.of(context).colorScheme.onSecondary,
              value: value,
              onChanged: (val) {
                HapticFeedback.mediumImpact();
                onChanged?.call(val);
              },
            )
          : Switch(
              activeColor: Theme.of(context).primaryColor,
              inactiveTrackColor: Theme.of(context).colorScheme.surface,
              materialTapTargetSize: materialTapTargetSize,
              value: value,
              onChanged: (val) {
                HapticFeedback.mediumImpact();
                onChanged?.call(val);
              },
            ),
    );
  }
}
