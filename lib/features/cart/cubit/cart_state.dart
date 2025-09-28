import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oolio/features/cart/model/cart_item_model.dart';

part 'cart_state.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState({
    @Default([]) List<CartItemModel> items,
    String? errorMessage,
    @Default(false) bool submitted,
  }) = _CartState;

  const CartState._();

  /// Sum of all cart item costs
  double get grandTotal =>
      items.fold(0, (sum, item) => sum + item.cost);
}
