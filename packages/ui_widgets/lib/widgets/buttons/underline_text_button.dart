import 'package:flutter/material.dart';

class UnderlineTextButton extends StatelessWidget {
  const UnderlineTextButton({
    super.key,
    required this.label,
    this.color,
    this.readOnly = false,
    this.padding,
    required this.onTap,
  });

  final String label;
  final Color? color;
  final bool readOnly;
  final EdgeInsets? padding;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final disableColor =
        Theme.of(context).colorScheme.secondary.withValues(alpha: 0.3);
    return TextButton(
      onPressed: readOnly ? null : onTap,
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Text(
          label,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: readOnly ? disableColor : color,
                color: readOnly ? disableColor : color,
              ),
        ),
      ),
    );
  }
}
