import 'package:flutter/material.dart';
import 'package:ui_widgets/theme/gaps.dart';
import 'package:ui_widgets/theme/my_plus_font_size.dart';

class FormRow extends StatelessWidget {
  const FormRow(
      {super.key,
      required this.label,
      required this.content,
      this.showErrorContent = false});

  final String label;
  final String content;
  final bool showErrorContent;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '${showErrorContent ? '*' : ''}$label:',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: showErrorContent
                    ? Theme.of(context).colorScheme.error
                    : Theme.of(context).colorScheme.inversePrimary,
              ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: Gaps.spacing2),
          child: Text(
            content,
            style: TextStyle(
              fontSize: MyPlusFontSize.titleCustom,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ],
    );
  }
}
