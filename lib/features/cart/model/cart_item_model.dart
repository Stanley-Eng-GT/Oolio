import 'package:freezed_annotation/freezed_annotation.dart';

import '../../product/models/product_model.dart';
part 'cart_item_model.freezed.dart';

@freezed
class CartItemModel with _$CartItemModel {
  const factory CartItemModel({
    required ProductModel product,
    required int count,
  }) = _CartItemModel;

  const CartItemModel._(); // private constructor for computed properties

  /// Total cost of this item (count * product price)
  double get cost => product.price * count;
}