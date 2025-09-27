import 'package:flutter/material.dart';
import 'package:ui_widgets/theme/my_plus_font_size.dart';

import '../../theme/gaps.dart';

class DefaultModal extends StatelessWidget {
  const DefaultModal({
    super.key,
    required this.children,
    this.title,
    this.topBarTrailing,
    this.showDivider = false,
    this.onCloseButtonTap,
  });

  final List<Widget> children;
  final String? title;
  final Widget? topBarTrailing;
  final bool showDivider;
  final VoidCallback? onCloseButtonTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          Gaps.spacing28,
          Gaps.spacing12,
          Gaps.spacing12,
          Gaps.spacing28,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: [
                Expanded(
                    child: title?.isNotEmpty == true
                        ? Text(title!,
                            style: TextStyle(
                              fontSize: MyPlusFontSize.titleCustom,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.secondary,
                            ))
                        : const SizedBox.shrink()),
                topBarTrailing ??
                    IconButton(
                      icon: Padding(
                        padding: const EdgeInsets.all(Gaps.spacing16),
                        child: Icon(
                          Icons.close,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      onPressed:
                          onCloseButtonTap ?? () => Navigator.of(context).pop(),
                    ),
              ],
            ),
            if (showDivider)
              const Padding(
                padding: EdgeInsets.only(
                  top: Gaps.spacing12,
                  right: Gaps.spacing16,
                ),
                child: Divider(),
              ),
            Padding(
              padding: const EdgeInsets.only(right: Gaps.spacing16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children,
              ),
            )
            // Add your other list items here
          ],
        ),
      ),
    );
  }
}
