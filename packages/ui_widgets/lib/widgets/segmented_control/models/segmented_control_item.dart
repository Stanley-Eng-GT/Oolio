import 'package:freezed_annotation/freezed_annotation.dart';

part 'segmented_control_item.freezed.dart';

@freezed
class SegmentedControlItem with _$SegmentedControlItem {
  const factory SegmentedControlItem({
    required String label,
    required String value,
  }) = _SegmentedControlItem;
}
