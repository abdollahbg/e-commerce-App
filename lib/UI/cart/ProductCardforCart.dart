import 'package:ecommerce_app/UI/cart/counter_Number_of_product.dart';
import 'package:ecommerce_app/cubit/cubit/cart_cubit.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Productcardforcart extends StatefulWidget {
  const Productcardforcart({super.key, required this.product});
  final ProductModel product;

  @override
  State<Productcardforcart> createState() => _ProductcardforcartState();
}

class _ProductcardforcartState extends State<Productcardforcart> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        // BlocBuilder يراقب أي تغيير في CartCubit
        final currentCount = context.watch<CartCubit>().getProductCountInCart(
          widget.product.id,
        );

        // إذا الكمية صفر نخفي الكارد
        if (currentCount == 0) {
          return const SizedBox.shrink();
        }

        final totalPrice = widget.product.price * currentCount;

        return Column(
          children: [
            Card(
              color: Colors.white,
              elevation: 0,
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Stack(
                  children: [
                    // Main content row
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: SizedBox(
                            width: 60,
                            height: 60,
                            child: Image.network(
                              widget.product.imageUrl,
                              fit: BoxFit.fitHeight,
                              loadingBuilder: (context, child, progress) {
                                if (progress == null) return child;
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey[200],
                                  child: const Icon(
                                    Icons.broken_image,
                                    size: 30,
                                    color: Colors.grey,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),

                        // Product Details and Counter
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.product.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 8),
                              CounterNumberOfProduct(
                                product: widget.product,
                                isInCartScreen: true,
                                onCountChanged: (newCount) {
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                        ),

                        const Spacer(),
                      ],
                    ),

                    // Delete Button
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          iconSize: 16,
                          icon: const Icon(
                            Icons.delete_outline,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            context.read<CartCubit>().deleteFromCart(
                              widget.product.id,
                            );
                          },
                        ),
                      ),
                    ),

                    // Price - Bottom Right
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          const Text(
                            '\$',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            totalPrice.toStringAsFixed(2),
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(height: 1, thickness: 1),
          ],
        );
      },
    );
  }
}
