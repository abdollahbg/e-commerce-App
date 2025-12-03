import 'package:ecommerce_app/UI/Order/Order_details.dart';
import 'package:ecommerce_app/UI/cart/ProductCardforCart.dart';
import 'package:ecommerce_app/cubit/cubit/cart_cubit.dart';
import 'package:ecommerce_app/models/Cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.read<CartCubit>(); // أخذ الكارت من الكيوبت

    return Scaffold(
      floatingActionButton: SizedBox(
        width: 200,
        height: 56,
        child: FloatingActionButton(
          onPressed: () {
            final cart = context.read<CartCubit>().cart;
            OrderDetails.show(context, cart);
          },
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 0,
          child: const Text(
            'Order Now',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('My Cart'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (cartCubit.cart.products.isEmpty) {
            return const Center(
              child: Text(
                'Your cart is empty',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }

          return ListView.builder(
            itemCount: cartCubit.cart.products.length,
            itemBuilder: (context, index) {
              final product = cartCubit.cart.products[index];
              return Productcardforcart(product: product);
            },
          );
        },
      ),
    );
  }
}
