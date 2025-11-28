import 'package:ecommerce_app/models/Cart.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  void addProductToCart(ProductModel product) {
    int index = Cart.products.indexWhere((element) => element.id == product.id);

    if (index == -1) {
      Cart.products.add(product);
    } else {
      Cart.products[index].quantity += product.quantity;
    }
    emit(AddinCart());
  }

  void deleteFromCart(int id) {
    Cart.products.removeWhere((element) => element.id == id);
    emit(DeleteFromCart());
  }
}
