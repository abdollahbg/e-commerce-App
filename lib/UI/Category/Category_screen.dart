import 'package:ecommerce_app/UI/product/productCard.dart';
import 'package:ecommerce_app/cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryScreen extends StatefulWidget {
  final String category;

  const CategoryScreen({super.key, required this.category});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final filteredProducts =
        (BlocProvider.of<ProductCubit>(context).state as ProductLoaded).products
            .where((product) => product.category == widget.category)
            .toList();

    return Scaffold(
      appBar: AppBar(title: Text(widget.category)),

      backgroundColor: Colors.white,
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                shrinkWrap: true,

                itemCount: filteredProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.0,
                  crossAxisSpacing: 16.0,
                  childAspectRatio: 0.6,
                ),
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];

                  return ProductCard(
                    id: product.id,
                    title: product.title,
                    price: product.price,
                    imageUrl: product.imageUrl,
                    description: product.description,
                    category: product.category,
                  );
                },
              ),
            );
          } else if (state is ProductError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }
          return const Text("Error");
        },
      ),
    );
  }
}
