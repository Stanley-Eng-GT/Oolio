import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_widgets/theme/gaps.dart';

import '../../generated/l10n.dart';
import '../../theme/radius_values.dart';
import '../modals/default_modal.dart';

const int _firstDateYear = 1900;
const int defaultDateYear = 1970;
const double _datePickerHeight = 250.0;

Future<void> selectDate({
  required BuildContext context,
  String? title,
  DateTime? lastSelectedDate,
  DateTime? minimumDate,
  DateTime? maximumDate,
  CupertinoDatePickerMode mode = CupertinoDatePickerMode.date,
  ValueChanged<DateTime?>? onDateSelected,
  bool useRootNavigator = false,
}) async {
  showModalBottomSheet(
    useRootNavigator: useRootNavigator,
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
            height: _datePickerHeight,
            child: CupertinoDatePicker(
              mode: mode,
              minimumYear: _firstDateYear,
              minimumDate: minimumDate,
              maximumDate: maximumDate,
              initialDateTime:
                  lastSelectedDate ?? minimumDate ?? DateTime(defaultDateYear),
              onDateTimeChanged: (val) => onDateSelected?.call(val),
            ),
          ),
        ],
      );
    },
  );
}
