import 'package:flutter/material.dart';
import 'package:ui_widgets/widgets/progress/stage_indicator/stage_indicator_status.dart';

class _StageIndicatorItemConstants {
  static const double size = 28.0;
  static const double selectedBorderWidth = 2.0;
  static const double defaultBorderWidth = 1.0;
}

class StageIndicatorItem extends StatelessWidget {
  const StageIndicatorItem({
    super.key,
    required this.title,
    required this.status,
  });

  final String title;
  final StageIndicatorStatus status;

  @override
  Widget build(BuildContext context) {
    final foregroundColor = _getForegroundColor(context);
    return Container(
      width: _StageIndicatorItemConstants.size,
      height: _StageIndicatorItemConstants.size,
      decoration: BoxDecoration(
        color: _getBackgroundColor(context),
        shape: BoxShape.circle,
        border: Border.all(
          color: foregroundColor,
          width: _borderWidth,
        ),
      ),
      child: Center(
        child: _getBody(context),
      ),
    );
  }

  Color _getForegroundColor(BuildContext context) => switch (status) {
        StageIndicatorStatus.highlighted =>
          Theme.of(context).colorScheme.surface,
        StageIndicatorStatus.unselected =>
          Theme.of(context).colorScheme.inversePrimary,
        (_) => Theme.of(context).colorScheme.primary,
      };

  Color? _getBackgroundColor(BuildContext context) => switch (status) {
        StageIndicatorStatus.highlighted =>
          Theme.of(context).colorScheme.primary,
        StageIndicatorStatus.completed => Theme.of(context).colorScheme.primary,
        (_) => null,
      };

  double get _borderWidth => switch (status) {
        StageIndicatorStatus.selected =>
          _StageIndicatorItemConstants.selectedBorderWidth,
        (_) => _StageIndicatorItemConstants.defaultBorderWidth,
      };

  Widget _getBody(BuildContext context) => switch (status) {
        StageIndicatorStatus.completed => Icon(
            Icons.check,
            color: Theme.of(context).colorScheme.surface,
          ),
        (_) => Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: _getForegroundColor(context),
                  fontWeight: FontWeight.bold,
                ),
            textScaler: TextScaler.noScaling,
          ),
      };
}
