import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../model/product_model.dart';
import '../repository/product_repository.dart';

part 'products_event.dart';

part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductRepository repository;

  ProductsBloc(this.repository) : super(ProductsInitial()) {
    on<GetProducts>((event, emit) async {
      emit(ProductsLoading());

      final result = await repository.getProducts();

      if (result.isEmpty) {
        emit(ProductsFailed(error: "No Products"));
      }
      emit(ProductsLoaded(products: result));
    });
  }
}
