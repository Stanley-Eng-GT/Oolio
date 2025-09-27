import 'package:flutter/material.dart';

import '../../theme/gaps.dart';

class KeyboardToolBarButton extends StatelessWidget {
  const KeyboardToolBarButton({
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
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Gaps.spacing8,
          vertical: Gaps.spacing4,
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
