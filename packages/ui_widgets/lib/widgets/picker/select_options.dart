import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_widgets/theme/gaps.dart';

import '../../generated/l10n.dart';
import '../../theme/radius_values.dart';
import '../modals/default_modal.dart';

const double _pickerHeight = 250.0;

Future<void> selectOptions({
  required BuildContext context,
  required String title,
  required List<String> options,
  int? lastSelectedIndex,
  ValueChanged<int>? onSelected,
}) async {
  showModalBottomSheet(
    constraints: const BoxConstraints(maxWidth: double.infinity),
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
        borderRadius:
            BorderRadius.all(Radius.circular(RadiusValues.circular10))),
    context: context,
    builder: (BuildContext context) {
      return DefaultModal(
        showDivider: true,
        title: title,
        topBarTrailing: TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Padding(
            padding: const EdgeInsets.all(Gaps.spacing16),
            child: Text(
              S.of(context).done,
            ),
          ),
        ),
        children: [
          SizedBox(
            height: _pickerHeight,
            child: CupertinoPicker(
              magnification: 1.22,
              squeeze: 1.2,
              useMagnifier: true,
              itemExtent: 32.0,
              scrollController: FixedExtentScrollController(
                initialItem: lastSelectedIndex ?? 0,
              ),
              // This is called when selected item is changed.
              onSelectedItemChanged: (int index) => onSelected?.call(index),
              children: List<Widget>.generate(options.length, (int index) {
                return Center(child: Text(options[index]));
              }),
            ),
          ),
        ],
      );
    },
  );
}
