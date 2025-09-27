import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oolio/features/product/models/product_model.dart';
import 'package:oolio/utils/extensions/cubit_extensionsions.dart';
import 'package:web_services/http_request/result.dart';

import '../repository/product_repository.dart';

part 'product_state.dart';
part 'product_cubit.freezed.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit({
    ProductRepository? repository,
  })
      : _repository = repository ?? ProductRepository(),
        super(const ProductState.loading());

  final ProductRepository _repository;
  List<ProductModel> _allProducts = [];

  Future<void> loadData() async {
    try {
      final result = await _repository.getProductData();

      switch (result) {
        case Success(value: final response):
          _allProducts = response;
          safeEmit(ProductState.loaded(
            productList: response,
          ));
          break;

        case Failure(exception: final e):
          safeEmit(ProductState.error(message: e.toString()));
          break;
      }
    } on Exception catch (e) {
      log(e.toString());
      safeEmit(ProductState.error(message: e.toString()));
    }
  }

  void filterProducts(String query) {
    if (query.isEmpty) {
      emit(ProductState.loaded(productList: _allProducts, query: ''));
    } else {
      final filtered = _allProducts
          .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
          .toList();

      emit(ProductState.loaded(productList: filtered, query: query));
    }
  }
}