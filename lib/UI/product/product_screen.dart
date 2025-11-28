import 'package:ecommerce_app/UI/cart/counter_Number_of_product.dart';
import 'package:ecommerce_app/cubit/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/UI/cart/cart_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.product});
  final ProductModel product;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool readmore = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Product'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const CartScreen()));
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // الخلفية
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenHeight * 0.46,
            child: Image.network(widget.product.imageUrl, fit: BoxFit.contain),
          ),

          // طبقة تغميق
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenHeight * 0.60,
            child: Container(color: Colors.black.withOpacity(0.2)),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              constraints: BoxConstraints(maxHeight: screenHeight * 0.45),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.title,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final textSpan = TextSpan(
                            text: widget.product.description,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          );

                          final textPainter = TextPainter(
                            text: textSpan,
                            maxLines: 3,
                            textDirection: TextDirection.ltr,
                          );

                          textPainter.layout(maxWidth: constraints.maxWidth);

                          final isTextLong = textPainter.didExceedMaxLines;

                          return GestureDetector(
                            onTap: () {
                              if (isTextLong) {
                                setState(() {
                                  readmore = !readmore;
                                });
                              }
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: widget.product.description,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                      if (isTextLong && !readmore)
                                        const TextSpan(
                                          text: '... ',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                          ),
                                        ),
                                    ],
                                  ),
                                  maxLines: readmore ? null : 3,
                                  overflow: readmore
                                      ? TextOverflow.visible
                                      : TextOverflow.ellipsis,
                                ),
                                if (isTextLong)
                                  Text(
                                    readmore ? 'Read less' : 'Read more...',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: readmore
                                          ? Colors.grey
                                          : Colors.indigo,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                              ],
                            ),
                          );
                        },
                      ),
                      Divider(),

                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('choose amount', style: TextStyle(fontSize: 18)),
                          CounterNumberOfProduct(
                            initialCount: widget.product.quantity,
                            product: widget.product,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$${widget.product.price}",
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          MaterialButton(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 28,
                              vertical: 12,
                            ),
                            color: Colors.indigo,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            onPressed: () {
                              context.read<CartCubit>().addProductToCart(
                                widget.product,
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Product added to cart"),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            },
                            child: const Text(
                              "Add to cart",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
