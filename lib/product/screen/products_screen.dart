import 'package:bloc_eg/product/bloc/products_bloc.dart';
import 'package:bloc_eg/product/repository/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsBloc(ProductRepository())
        ..add(
          GetProducts(
            userId: "dummyUser",
          ),
        ),
      child: Scaffold(
        appBar: AppBar(title: Text('Products')),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Text('Your Products'),
              BlocBuilder<ProductsBloc, ProductsState>(
                builder: (context, state) {
                  if (state is ProductsLoading) {
                    return const CircularProgressIndicator();
                  }
                  if (state is ProductsFailed) {
                    return Text(state.error);
                  }
                  if (state is ProductsLoaded) {
                    return SizedBox(
                      height: 300,
                      child: ListView.builder(
                        itemCount: state.products.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final product = state.products[index];

                          return Container(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(product.name),
                                Text(("Stock : ${product.stock}"))
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  }
                  return Text('Unknown state');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
