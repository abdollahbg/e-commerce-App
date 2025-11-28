import 'package:ecommerce_app/models/product_model.dart';
import 'package:flutter/material.dart';

// تم إزالة 'must_be_immutable' لأننا سنستخدم الحالة في الـ State
class CounterNumberOfProduct extends StatefulWidget {
  final int initialCount;
  final ProductModel product;
  const CounterNumberOfProduct({
    super.key,
    required this.initialCount,
    required this.product,
  });

  @override
  State<CounterNumberOfProduct> createState() => _CounterNumberOfProductState();
}

class _CounterNumberOfProductState extends State<CounterNumberOfProduct> {
  @override
  void initState() {
    super.initState();
  }

  void _incrementCount() {
    setState(() {
      widget.product.incrementQuantity();
    });
  }

  void _decrementCount() {
    setState(() {
      widget.product.decrementQuantity();
    });
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

    return Container(
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
            isInactive: widget.product.quantity == 1,
          ),

          const SizedBox(width: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              '${widget.product.quantity}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
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
    );
  }
}
