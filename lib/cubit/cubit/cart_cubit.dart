import 'package:ecommerce_app/models/Cart.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  Cart cart = Cart();

  CartCubit() : super(CartInitial());

  int getProductCountInCart(int productId) {
    try {
      final product = cart.products.firstWhere(
        (element) => element.id == productId,
      );
      return product.ItemCount;
    } catch (e) {
      return 0;
    }
  }

  void addProductToCart(ProductModel product, int count) {
    final existingProductIndex = cart.products.indexWhere(
      (element) => element.id == product.id,
    );

    if (existingProductIndex == -1) {
      final newProduct = product.copyWith(ItemCount: count);
      cart.products.add(newProduct);
    } else {
      final currentCount = cart.products[existingProductIndex].ItemCount;
      cart.products[existingProductIndex] = cart.products[existingProductIndex]
          .copyWith(ItemCount: currentCount + count);
    }
    emit(CartUpdated());
  }

  void updateProductCount(int productId, int newCount) {
    final existingProductIndex = cart.products.indexWhere(
      (element) => element.id == productId,
    );

    if (existingProductIndex != -1) {
      if (newCount <= 0) {
        deleteFromCart(productId);
      } else {
        cart.products[existingProductIndex] = cart
            .products[existingProductIndex]
            .copyWith(ItemCount: newCount);
        emit(CartUpdated());
      }
    }
  }

  void deleteFromCart(int id) {
    cart.products.removeWhere((element) => element.id == id);
    emit(CartUpdated());
  }

  void clearCart() {
    cart.products.clear();
    emit(CartUpdated());
  }
}
