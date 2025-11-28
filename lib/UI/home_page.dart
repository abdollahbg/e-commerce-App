import 'package:ecommerce_app/UI/product/offers_slider.dart';
import 'package:ecommerce_app/UI/product/productCard.dart';
import 'package:ecommerce_app/cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 35.0),
            child: OffersSlider(
              images: [
                'https://t3.ftcdn.net/jpg/03/61/35/76/360_F_361357616_KsWkGvqKrhhRnOrdoK0jc0WvzZKhzaN9.jpg',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHz1A92iyFbE8kRjNGiqYP-i6plqdL8lUyxg&s',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZ9TBWOYjnp2XuQTPfR5_hNaYhTnftfeQMtw&s',
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "New Arrivals",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "See All",
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ProductLoaded) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16.0,
                          crossAxisSpacing: 16.0,
                          childAspectRatio: 0.6,
                        ),
                    itemBuilder: (context, index) {
                      final product = state.products[index];
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
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
