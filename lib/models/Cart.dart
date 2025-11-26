import 'package:ecommerce_app/models/product_model.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  static List<ProductModel> products = [];

  @override
  List<Object?> get props => [products];
}
