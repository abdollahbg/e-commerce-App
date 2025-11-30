import 'package:ecommerce_app/cubit/cubit/cart_cubit.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterNumberOfProduct extends StatefulWidget {
  final ProductModel product;
  final bool isInCartScreen;
  final Function(int)? onCountChanged;

  const CounterNumberOfProduct({
    super.key,
    required this.product,
    this.isInCartScreen = false,
    this.onCountChanged,
  });

  @override
  State<CounterNumberOfProduct> createState() => _CounterNumberOfProductState();
}

class _CounterNumberOfProductState extends State<CounterNumberOfProduct> {
  late int count;

  @override
  void initState() {
    super.initState();

    count = context.read<CartCubit>().getProductCountInCart(widget.product.id);

    if (!widget.isInCartScreen && count == 0) {
      count = 1;
    }
  }

  void _incrementCount() {
    final newCount = count + 1;
    setState(() {
      count = newCount;
    });

    widget.onCountChanged?.call(newCount);

    if (widget.isInCartScreen) {
      context.read<CartCubit>().updateProductCount(widget.product.id, newCount);
    }
  }

  void _decrementCount() {
    if (count > 1) {
      final newCount = count - 1;
      setState(() {
        count = newCount;
      });

      widget.onCountChanged?.call(newCount);

      if (widget.isInCartScreen) {
        context.read<CartCubit>().updateProductCount(
          widget.product.id,
          newCount,
        );
      }
    }
  }

  Widget _buildCounterButton({
    required IconData icon,
    required VoidCallback onPressed,
    required Color color,
    required bool isInactive,
  }) {
    const double size = 32.0;
    const double iconSize = 18.0;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: IconButton(
        iconSize: iconSize,
        padding: EdgeInsets.zero,
        icon: Icon(icon, color: isInactive ? Colors.grey : Colors.black),
        onPressed: isInactive ? null : onPressed,
        splashRadius: size / 2,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color? backgroundColor = Colors.grey[200];
    const Color buttonColor = Colors.white;

    return BlocListener<CartCubit, dynamic>(
      listener: (context, state) {
        // When cart state changes, re-read the count for this product.
        final newCount = context.read<CartCubit>().getProductCountInCart(
          widget.product.id,
        );

        // If not in cart screen, keep the default minimum 1 when product not in cart.
        final effectiveNewCount = (!widget.isInCartScreen && newCount == 0)
            ? 1
            : newCount;

        if (effectiveNewCount != count) {
          setState(() {
            count = effectiveNewCount;
          });
          widget.onCountChanged?.call(count);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: backgroundColor,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildCounterButton(
              icon: Icons.remove,
              onPressed: _decrementCount,
              color: buttonColor,
              isInactive: count <= 1,
            ),
            const SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(
                '$count',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 10),
            _buildCounterButton(
              icon: Icons.add,
              onPressed: _incrementCount,
              color: buttonColor,
              isInactive: false,
            ),
          ],
        ),
      ),
    );
  }
}
