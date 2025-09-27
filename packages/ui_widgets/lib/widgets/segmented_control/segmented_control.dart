import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_widgets/theme/gaps.dart';
import 'package:ui_widgets/widgets/segmented_control/models/segmented_control_item.dart';

class SegmentedControl extends StatelessWidget {
  const SegmentedControl({
    super.key,
    required this.items,
    this.groupValue,
    required this.onValueChanged,
  });
  final List<SegmentedControlItem> items;
  final String? groupValue;
  final ValueChanged<String> onValueChanged;

  @override
  Widget build(BuildContext context) {
    return CupertinoSegmentedControl<SegmentedControlItem>(
      padding: EdgeInsets.zero,
      children: {
        for (var e in items)
          e: Padding(
            padding: const EdgeInsets.all(Gaps.spacing8),
            child: Text(
              e.label,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: e.value == groupValue
                        ? Theme.of(context).canvasColor
                        : Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          )
      },
      onValueChanged: (e) => onValueChanged(e.value),
      groupValue: items.where((item) => item.value == groupValue).first,
    );
  }
}
