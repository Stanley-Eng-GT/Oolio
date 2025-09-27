import 'package:flutter/material.dart';
import 'package:ui_widgets/theme/gaps.dart';
import 'package:ui_widgets/widgets/progress/stage_indicator/stage_indicator_item.dart';
import 'package:ui_widgets/widgets/progress/stage_indicator/stage_indicator_status.dart';

class StageIndicator extends StatelessWidget {
  const StageIndicator({
    super.key,
    required this.currentIndex,
    required this.currentState,
    required this.totalLength,
  });

  final int currentIndex;
  final StageIndicatorStatus currentState;
  final int totalLength;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(totalLength, (index) {
        StageIndicatorStatus status;
        if (index < currentIndex) {
          status = StageIndicatorStatus.completed;
        } else if (index == currentIndex) {
          status = currentState;
        } else {
          status = StageIndicatorStatus.unselected;
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: Gaps.spacing4),
          child: StageIndicatorItem(
            title: '${index + 1}',
            status: status,
          ),
        );
      }),
    );
  }
}
