part of 'product_cubit.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.loading() = _Loading;
  const factory ProductState.loaded(
      {required List<ProductModel> productList}) = _Loaded;
  const factory ProductState.error({required String message}) = _Error;
}
