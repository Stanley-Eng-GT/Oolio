import 'package:flutter/material.dart';
import 'package:ui_widgets/theme/gaps.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({
    super.key,
    required this.description,
    this.style,
  });
  final String description;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final textStyle = style ??
        Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: Theme.of(context).colorScheme.secondary);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '•',
          style: textStyle,
        ),
        const SizedBox(width: Gaps.spacing4),
        Expanded(
          child: Text(
            description,
            style: textStyle,
          ),
        ),
      ],
    );
  }
}
