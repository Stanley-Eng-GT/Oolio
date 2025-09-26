import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oolio/features/product/models/product_model.dart';

part 'product_list_response.freezed.dart';
part 'product_list_response.g.dart';

@Freezed()
class ProductListResponse with _$ProductListResponse {
  const factory ProductListResponse({
    required List<ProductModel> d,
  }) = _ProductListResponse;

  factory ProductListResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductListResponseFromJson(json);
}
