import 'package:flutter/material.dart';
import 'package:ui_widgets/widgets/keyboards/digit_keyboard/models/digit_key_model.dart';
import 'package:ui_widgets/widgets/keyboards/digit_keyboard/views/digit_key_view.dart';

import '../../../generated/l10n.dart';
import '../../../theme/gaps.dart';
import 'digit_keyboard_constants.dart';

class DigitKeyboardView extends StatelessWidget {
  const DigitKeyboardView({
    super.key,
    this.onKeyTap,
  });

  final ValueChanged<DigitKeyModel>? onKeyTap;

  @override
  Widget build(BuildContext context) {
    const keys = DigitKeyboardConstants.keys;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ColoredBox(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            child: Row(
              children: [
                const Spacer(),
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: Gaps.spacing12,
                        horizontal: Gaps.spacing8,
                      ),
                      child: Text(
                        S.of(context).done,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                      ),
                    )),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(
              Gaps.spacing8,
              Gaps.spacing8,
              Gaps.spacing8,
              Gaps.spacing64,
            ),
            color: Theme.of(context).colorScheme.onSecondary,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: DigitKeyboardConstants
                    .crossAxisCount, // number of items in each row
                mainAxisSpacing: _mainAxisSpacing, // spacing between rows
                crossAxisSpacing: _crossAxisSpacing, // spacing between columns
                mainAxisExtent: 50.0, //_getKeyWidth(context),
                childAspectRatio: 0.5,
              ),
              padding: EdgeInsets.zero, // padding around the grid
              shrinkWrap: true,
              itemCount: keys.length, // total number of items
              itemBuilder: (context, index) => keys[index].maybeMap(
                orElse: () {
                  final key = keys[index];
                  return DigitKeyView(
                    digitKeyModel: key,
                    onTap: () => onKeyTap?.call(key),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  double get _mainAxisSpacing => Gaps.spacing8;

  double get _crossAxisSpacing => Gaps.spacing8;
}
