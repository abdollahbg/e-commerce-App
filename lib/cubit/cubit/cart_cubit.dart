import 'package:ecommerce_app/models/Cart.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  // دالة جديدة للحصول على الكمية الحالية للمنتج في السلة
  int getProductCountInCart(int productId) {
    try {
      final product = Cart.products.firstWhere(
        (element) => element.id == productId,
      );
      return product.ItemCount;
    } catch (e) {
      return 0;
    }
  }

  void addProductToCart(ProductModel product, int count) {
    final existingProductIndex = Cart.products.indexWhere(
      (element) => element.id == product.id,
    );

    if (existingProductIndex == -1) {
      // المنتج غير موجود في السلة - نضيفه جديداً
      final newProduct = product.copyWith(ItemCount: count);
      Cart.products.add(newProduct);
    } else {
      // المنتج موجود - نضيف الكمية الجديدة إلى الكمية الحالية
      final currentCount = Cart.products[existingProductIndex].ItemCount;
      Cart.products[existingProductIndex] = Cart.products[existingProductIndex]
          .copyWith(ItemCount: currentCount + count);
    }
    emit(AddinCart());
  }

  void updateProductCount(int productId, int newCount) {
    final existingProductIndex = Cart.products.indexWhere(
      (element) => element.id == productId,
    );

    if (existingProductIndex != -1) {
      if (newCount <= 0) {
        // إذا كانت الكمية صفر أو أقل، نزيل المنتج من السلة
        deleteFromCart(productId);
      } else {
        // نحدث الكمية فقط
        Cart.products[existingProductIndex] = Cart
            .products[existingProductIndex]
            .copyWith(ItemCount: newCount);
        emit(UpdateCart());
      }
    }
  }

  void deleteFromCart(int id) {
    Cart.products.removeWhere((element) => element.id == id);
    emit(DeleteFromCart());
  }
}
