import 'package:freezed_annotation/freezed_annotation.dart';

part 'toggle_selection_model.freezed.dart';

@freezed
class ToggleSelectionModel<T> with _$ToggleSelectionModel<T> {
  const factory ToggleSelectionModel(
      {required T type,
      required String label,
      @Default(false) bool isSelected}) = _ToggleSelectionModel;
}
