import 'package:ecommerce_app/models/Cart.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:equatable/equatable.dart';

class Order extends Equatable {
  int id;
  final List<ProductModel> products;

  Order({required this.id, required Cart cart})
    : products = List.from(cart.products); // هنا النقل الصحيح

  @override
  List<Object?> get props => [id, products];
}
