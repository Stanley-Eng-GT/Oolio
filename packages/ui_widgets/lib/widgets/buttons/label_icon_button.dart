import 'package:flutter/material.dart';

const double _arrowIconSize = 16.0;

class LabelIconButton extends StatelessWidget {
  const LabelIconButton({
    super.key,
    required this.label,
    this.onTap,
  });
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap,
        child: Row(
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Theme.of(context).colorScheme.primary,
              size: _arrowIconSize,
            )
          ],
        ));
  }
}
