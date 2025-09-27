import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../../theme/gaps.dart';

class _ColorSelectRowConstants {
  static const double colorBoxSize = 20.0;
  static const int defaultTextColorIntValue = 4294940672;
}

class ColorSelectRow extends StatelessWidget {
  const ColorSelectRow({
    super.key,
    this.textColor,
    this.onTap,
  });
  final int? textColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Card(
            child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: Gaps.spacing12, horizontal: Gaps.spacing16),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Gaps.spacing14,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    S.of(context).textColor,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                  ),
                ),
                const SizedBox(width: Gaps.spacing4),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.inverseSurface,
                    ),
                    color: Color(textColor ??
                        _ColorSelectRowConstants.defaultTextColorIntValue),
                  ),
                  height: _ColorSelectRowConstants.colorBoxSize,
                  width: _ColorSelectRowConstants.colorBoxSize,
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
