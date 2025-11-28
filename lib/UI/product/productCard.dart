// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'product_screen.dart';

class ProductCard extends StatelessWidget {
  final int id;
  final String title;
  final double price;
  final String imageUrl;
  final String description;
  final String category;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.description,
    required this.category,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap:
            onTap ??
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductScreen(
                    product: ProductModel(
                      id: id,
                      title: title,
                      price: price,
                      description: description,
                      category: category,
                      imageUrl: imageUrl,
                    ),
                  ),
                ),
              );
            },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.contain,
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

                const SizedBox(height: 12),

                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 4),

                Text(
                  '\$${price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.deepPurple,
                  ),
                ),

                const SizedBox(height: 4),

                ...[
                  Text(
                    category,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
