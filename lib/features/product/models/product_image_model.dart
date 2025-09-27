import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_image_model.freezed.dart';
part 'product_image_model.g.dart';

@Freezed()
class ProductImageModel with _$ProductImageModel {
  const factory ProductImageModel({
    required String thumbnail,
    required String mobile,
    required String tablet,
    required String desktop,
  }) = _ProductImageModel;

  factory ProductImageModel.fromJson(Map<String, dynamic> json) =>
      _$ProductImageModelFromJson(json);
}