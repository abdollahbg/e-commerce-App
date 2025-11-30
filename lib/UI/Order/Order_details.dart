import 'package:ecommerce_app/cubit/cubit/cart_cubit.dart';
import 'package:ecommerce_app/cubit/cubit/order_cubit.dart';
import 'package:ecommerce_app/models/Cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderDetails extends StatelessWidget {
  final Cart cart;

  const OrderDetails({super.key, required this.cart});

  // دالة لفتح الـ BottomSheet
  static void show(BuildContext context, Cart cart) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => OrderDetails(cart: cart),
    );
  }

  double get subtotal {
    return Cart.products.fold(0.0, (sum, product) {
      return sum + (product.price * product.ItemCount);
    });
  }

  double get shipping {
    return 6.0;
  }

  // حساب التوتال
  double get total {
    return subtotal + shipping;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Promo Code Field
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter your promo code',
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.arrow_forward, color: Colors.purple),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Order Summary
              const Text(
                'Order Summary',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              // Subtotal
              _buildPriceRow('Subtotal', '\$${subtotal.toStringAsFixed(2)}'),
              const SizedBox(height: 8),

              // Shipping
              _buildPriceRow('Shipping', '\$${shipping.toStringAsFixed(2)}'),
              const SizedBox(height: 8),

              // Divider
              const Divider(height: 20, thickness: 1),
              const SizedBox(height: 8),

              // Total
              _buildPriceRow(
                'Total amount',
                '\$${total.toStringAsFixed(2)}',
                isTotal: true,
              ),

              const SizedBox(height: 24),

              // Checkout Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<OrderCubit>(context).addOrder(cart);
                    context.read<CartCubit>().clearCart();
                    Navigator.pop(context); // إغلاق الـ BottomSheet
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Order placed successfully!')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 4,
                  ),
                  child: const Text(
                    'Checkout',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}

Widget _buildPriceRow(String title, String price, {bool isTotal = false}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey[700],
          fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      Text(
        price,
        style: TextStyle(
          fontSize: isTotal ? 18 : 16,
          color: isTotal ? Colors.black : Colors.grey[700],
          fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    ],
  );
}
