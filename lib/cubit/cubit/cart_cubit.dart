import 'package:ecommerce_app/models/Cart.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  void addinCart(ProductModel product) {
    Cart.products.add(product);
    emit(AddinCart());
  }

  void deletefromCart(int id) {
    Cart.products.remove(id);
    emit(DeleteFromCart());
  }
}
