class ProductModel {
  final String name;
  final String imageUrl;
  final int stock;
  final List<String> colors;

  const ProductModel({
    required this.name,
    required this.imageUrl,
    required this.stock,
    required this.colors,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json["name"],
      imageUrl: json["imageUrl"],
      stock: json['stock'],
      colors: List<String>.from(json["colors"].map((item) => item)),
    );
  }
}
