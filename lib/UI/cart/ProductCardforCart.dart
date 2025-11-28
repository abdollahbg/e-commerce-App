import 'package:ecommerce_app/UI/cart/counter_Number_of_product.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:flutter/material.dart';

class Productcardforcart extends StatefulWidget {
  const Productcardforcart({super.key, required this.product});
  final ProductModel product;

  @override
  State<Productcardforcart> createState() => _ProductcardforcartState();
}

class _ProductcardforcartState extends State<Productcardforcart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: Colors.white, // flat white background
          elevation: 0, // remove shadow
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SizedBox(
                    width: 70,
                    height: 70,
                    child: Image.network(
                      widget.product.imageUrl,
                      fit: BoxFit.fitHeight,
                      loadingBuilder: (context, child, progress) {
                        if (progress == null) return child;
                        return const Center(child: CircularProgressIndicator());
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[200],
                          child: const Icon(
                            Icons.broken_image,
                            size: 50,
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      CounterNumberOfProduct(
                        initialCount: 1,
                        product: widget.product,
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 12),

                Text(
                  '\$${(widget.product.price * widget.product.quantity).toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Divider at the end
        const Divider(height: 1, thickness: 1),
      ],
    );
  }
}
