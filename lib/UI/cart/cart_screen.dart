import 'package:ecommerce_app/UI/cart/ProductCardforCart.dart';
import 'package:ecommerce_app/models/Cart.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Cart')),
      body: ListView.builder(
        itemCount: Cart.products.length,
        itemBuilder: (context, index) {
          final product = Cart.products[index];
          return Productcardforcart(product: product);
        },
      ),
    );
  }
}
