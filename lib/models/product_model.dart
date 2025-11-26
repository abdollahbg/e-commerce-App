// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  int id;
  String title;
  double price;
  String description;
  String category;
  String imageUrl;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.imageUrl,
  });

  factory ProductModel.fromjson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as int,
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String,
      category: json['category'] as String,
      imageUrl: json['image'] as String,
    );
  }
}
