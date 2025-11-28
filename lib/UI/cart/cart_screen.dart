import 'package:ecommerce_app/UI/cart/ProductCardforCart.dart';
import 'package:ecommerce_app/cubit/cubit/cart_cubit.dart';
import 'package:ecommerce_app/models/Cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('My Cart'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: Cart.products.length,
            itemBuilder: (context, index) {
              final product = Cart.products[index];
              return Productcardforcart(product: product);
            },
          );
        },
      ),
    );
  }
}
