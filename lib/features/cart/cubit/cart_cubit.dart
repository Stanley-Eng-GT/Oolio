import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oolio/features/cart/repository/cart_repository.dart';
import 'package:web_services/http_request/result.dart';
import '../../product/models/product_model.dart';
import '../model/cart_item_model.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit({
    CartRepository? repository,
  })  : _repository = repository ?? CartRepository(),
        super(const CartState());

  final CartRepository _repository;

  /// Add a product to the cart (increments count if already exists)
  void addProduct(ProductModel product) {
    final index =
        state.items.indexWhere((item) => item.product.id == product.id);
    List<CartItemModel> updatedItems = List.from(state.items);

    if (index != -1) {
      final existing = updatedItems[index];
      updatedItems[index] = existing.copyWith(count: existing.count + 1);
    } else {
      updatedItems.add(CartItemModel(product: product, count: 1));
    }

    emit(state.copyWith(items: updatedItems));
  }

  /// Decrease product quantity by 1 (removes if count reaches 0)
  void decreaseProduct(ProductModel product) {
    final index =
        state.items.indexWhere((item) => item.product.id == product.id);
    if (index == -1) return;

    List<CartItemModel> updatedItems = List.from(state.items);
    final item = updatedItems[index];

    if (item.count > 1) {
      updatedItems[index] = item.copyWith(count: item.count - 1);
    } else {
      updatedItems.removeAt(index);
    }

    emit(state.copyWith(items: updatedItems));
  }

  /// Remove product completely from the cart
  void removeProduct(ProductModel product) {
    final updatedItems =
        state.items.where((item) => item.product.id != product.id).toList();
    emit(state.copyWith(items: updatedItems));
  }

  /// Clear all items in the cart
  void clearCart() {
    emit(const CartState());
  }

  void submitOrder() async {
    final result = await _repository.submitOrder(state.items);
    final _ = switch (result) {
      Success(value: _) => emit(state.copyWith(submitted: true)),
      Failure(exception: final e) => emit(state.copyWith(errorMessage: e.toString())),
    };
    emit(const CartState());
  }

  void dismissErrorAlert() =>  emit(state.copyWith(errorMessage: null));
}
