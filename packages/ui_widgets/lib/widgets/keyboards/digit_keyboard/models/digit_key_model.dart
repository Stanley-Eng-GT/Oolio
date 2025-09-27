import 'package:freezed_annotation/freezed_annotation.dart';
part 'digit_key_model.freezed.dart';
part 'digit_key_model.g.dart';

@freezed
class DigitKeyModel with _$DigitKeyModel {
  const factory DigitKeyModel.digitOnly({
    required String title,
  }) = _DigitOnly;
  const factory DigitKeyModel.digitWithChars({
    required String title,
    required String subtitle,
  }) = _DigitWithChars;
  const factory DigitKeyModel.delete() = _Delete;
  const factory DigitKeyModel.dot() = _Dot;

  factory DigitKeyModel.fromJson(Map<String, dynamic> json) =>
      _$DigitKeyModelFromJson(json);
}
