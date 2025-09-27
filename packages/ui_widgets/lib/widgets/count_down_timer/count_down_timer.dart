import 'package:flutter/material.dart';
import 'package:ui_widgets/widgets/count_down_timer/count_down_timer_helper.dart';
import 'package:ui_widgets/widgets/count_down_timer/count_down_timer_status.dart';

import 'count_down_timer_constants.dart';

class CountDownTimer extends StatefulWidget {
  const CountDownTimer({
    super.key,
    required this.timerStatus,
    required this.onTimeExpires,
    CountDownTimerHelper? countDownTimerHelper,
  }) : timerHelper = countDownTimerHelper ?? const CountDownTimerHelper();

  final CountDownTimerStatus timerStatus;
  final VoidCallback onTimeExpires;
  final CountDownTimerHelper timerHelper;

  @override
  State createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Duration duration;

  @override
  void initState() {
    super.initState();
    duration =
        const Duration(seconds: CountDownTimerConstants.durationInSecond);
    _controller = AnimationController(
      vsync: this,
      duration: duration,
    );
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        widget.onTimeExpires();
      }
    });
  }

  @override
  void didUpdateWidget(CountDownTimer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.timerStatus == CountDownTimerStatus.idle &&
        widget.timerStatus == CountDownTimerStatus.countingDown) {
      _controller.reverse(
          from: CountDownTimerConstants.durationInSecond.toDouble());
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final timerStatus = widget.timerStatus;
    switch (timerStatus) {
      case CountDownTimerStatus.countingDown:
        return AnimatedBuilder(
          animation: _controller,
          builder: (_, Widget? child) {
            return Text(
              widget.timerHelper
                  .getTimerText(_controller.duration, _controller.value),
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.secondary),
            );
          },
        );
      default:
        final double timerControllerValue;
        switch (timerStatus) {
          case CountDownTimerStatus.idle:
            timerControllerValue = 1.0;
          default:
            timerControllerValue = 0.0;
        }
        return Text(
          widget.timerHelper.getTimerText(duration, timerControllerValue),
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(color: Theme.of(context).colorScheme.secondary),
        );
    }
  }
}
