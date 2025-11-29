class ProductModel {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final String imageUrl;
  int ItemCount;

  ProductModel({
    required this.id,
    required this.title,
    this.description = '',
    this.category = '',
    required this.price,
    required this.imageUrl,
    this.ItemCount = 0,
  });

  // إضافة دالة copyWith لإنشاء نسخة من المنتج مع تحديث بعض الخصائص
  ProductModel copyWith({
    int? id,
    String? title,
    String? description,
    String? category,
    double? price,
    String? imageUrl,
    int? ItemCount,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      ItemCount: ItemCount ?? this.ItemCount,
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      price: (json['price'] as num).toDouble(),
      imageUrl: json['image'],
    );
  }
}
