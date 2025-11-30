import 'package:ecommerce_app/models/Cart.dart';
import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final List<Cart> cart = [];

  @override
  List<Object?> get props => [cart];
}
