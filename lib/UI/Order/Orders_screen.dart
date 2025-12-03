import 'package:ecommerce_app/UI/Order/Order_card.dart';
import 'package:ecommerce_app/cubit/cubit/order_cubit.dart';
import 'package:ecommerce_app/models/Order.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Your Orders'),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return OrderCard(order: order);
        },
      ),
    );
  }
}
