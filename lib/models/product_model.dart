// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  int id;
  String title;
  double price;
  String description;
  String category;
  String imageUrl;
  int _quantity;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.imageUrl,
    int quantity = 1,
  }) : _quantity = quantity;

  int get quantity => _quantity;

  set quantity(int value) {
    if (value >= 1) {
      _quantity = value;
    }
  }

  factory ProductModel.fromjson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as int,
      title: json['title'] as String,
      price: (json['price'] as num? ?? 0.0).toDouble(),
      description: json['description'] as String,
      category: json['category'] as String,
      imageUrl: json['image'] as String,
      quantity: 1,
    );
  }

  void incrementQuantity() {
    _quantity++;
  }

  void decrementQuantity() {
    if (_quantity > 1) {
      _quantity--;
    }
  }

  void updateQuantity(int newQuantity) {
    if (newQuantity >= 1) {
      _quantity = newQuantity;
    }
  }
}
