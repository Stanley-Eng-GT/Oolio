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

  Future<void> loadData() async {
    try {
      final result = await _repository.getProductData();
      final _ = switch (result) {
        Success(value: final response) =>
            safeEmit(ProductState.loaded(
              productList: response,
            )),
        Failure(exception: final e) =>
            safeEmit(ProductState.error(message: e.toString())),
      };
    } on Exception catch (e) {
      log(e.toString());
      safeEmit(ProductState.error(message: e.toString()));
    }
  }
}