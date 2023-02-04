part of 'products_bloc.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<ProductModel> products;

  ProductsLoaded({
    required this.products,
  });
}

class ProductsFailed extends ProductsState {
  final String error;

  ProductsFailed({
    required this.error,
  });
}
