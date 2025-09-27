import 'package:flutter/material.dart';
import 'package:ui_widgets/widgets/keyboards/pin_keyboard/pin_keyboard_constants.dart';
import 'package:ui_widgets/widgets/keyboards/pin_keyboard/widgets/pin_key_view.dart';

import '../../../theme/gaps.dart';
import 'models/pin_key_model.dart';

class PinKeyboardView extends StatelessWidget {
  const PinKeyboardView({
    super.key,
    this.onKeyTap,
  });

  final ValueChanged<PinKeyModel>? onKeyTap;

  @override
  Widget build(BuildContext context) {
    const keys = PinKeyboardConstants.keys;
    final isScreenLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final crossAxisCount = isScreenLandscape
        ? PinKeyboardConstants.landScapeCrossAxisCount
        : PinKeyboardConstants.portraitCrossAxisCount;
    return SizedBox(
      width: _getViewWidth(crossAxisCount),
      height: _getViewHeight(crossAxisCount),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount, // number of items in each row
          mainAxisSpacing: _mainAxisSpacing, // spacing between rows
          crossAxisSpacing: _crossAxisSpacing, // spacing between columns
          mainAxisExtent: PinKeyboardConstants.keyWidth,
        ),
        padding: EdgeInsets.zero, // padding around the grid
        shrinkWrap: true,
        itemCount: keys.length, // total number of items
        itemBuilder: (context, index) => keys[index].maybeMap(
          placeholder: (_) => const SizedBox.shrink(),
          orElse: () {
            final key = keys[index];
            return PinKeyView(
              pinKeyModel: key,
              onTap: () => onKeyTap?.call(key),
            );
          },
        ),
      ),
    );
  }

  double get _mainAxisSpacing => Gaps.spacing24;

  double get _crossAxisSpacing => Gaps.spacing24;

  double _getViewHeight(int crossAxisCount) {
    final mainAxisCount = PinKeyboardConstants.keys.length ~/ crossAxisCount;
    return PinKeyboardConstants.keyWidth * mainAxisCount +
        _mainAxisSpacing * (mainAxisCount - 1);
  }

  double _getViewWidth(int crossAxisCount) =>
      PinKeyboardConstants.keyWidth * crossAxisCount +
      _crossAxisSpacing * (crossAxisCount - 1);
}
