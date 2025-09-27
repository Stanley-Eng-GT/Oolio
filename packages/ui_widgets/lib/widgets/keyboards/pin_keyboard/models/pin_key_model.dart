import 'package:freezed_annotation/freezed_annotation.dart';
part 'pin_key_model.freezed.dart';
part 'pin_key_model.g.dart';

@freezed
class PinKeyModel with _$PinKeyModel {
  const factory PinKeyModel.digitOnly({
    required String title,
  }) = _DigitOnly;
  const factory PinKeyModel.digitWithChars({
    required String title,
    required String subtitle,
  }) = _DigitWithChars;
  const factory PinKeyModel.placeholder() = _Placeholder;
  const factory PinKeyModel.delete() = _Delete;

  factory PinKeyModel.fromJson(Map<String, dynamic> json) =>
      _$PinKeyModelFromJson(json);
}
