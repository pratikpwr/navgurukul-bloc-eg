import 'dart:convert';

import 'package:bloc_eg/product/model/product_model.dart';

class ProductRepository {
  Future<List<ProductModel>> getProducts() async {
    /// make a api call
    /// this will return a response
    ///

    await Future.delayed(Duration(seconds: 1));
    final respose = jsonDecode(jsonResponse);
    final products = List<ProductModel>.from(
      respose["products"].map(
        (product) => ProductModel.fromJson(product),
      ),
    );


    return products;
  }
}

const jsonResponse = """
    {
  "products" :[
    {
      "name" : "Rounded neck T-shirt",
      "imageUrl": "https://t3.ftcdn.net/jpg/02/42/98/96/360_F_242989677_vd52h26VyNj4NuYa8OBP0Z9AHKitr6Fd.jpg",
      "stock" : 3,
      "colors" :[
        "Green",
        "Red",
        "Black"
      ]
    },
    {
      "name" : "Jeans",
      "imageUrl": "https://t3.ftcdn.net/jpg/02/42/98/96/360_F_242989677_vd52h26VyNj4NuYa8OBP0Z9AHKitr6Fd.jpg",
      "stock" : 6,
      "colors" :[
        "Blue",
        "Grey",
        "Black"
      ]
    }
  ]
}
    """;
