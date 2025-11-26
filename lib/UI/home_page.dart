import 'package:ecommerce_app/UI/productCard.dart';
import 'package:ecommerce_app/cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ProductLoaded) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GridView.builder(
              itemCount: state.products.length, // عدد العناصر في القائمة
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 👈 تغيير العدد إلى عمودين
                mainAxisSpacing: 16.0, // تباعد رأسي بين الكروت
                crossAxisSpacing: 16.0, // تباعد أفقي بين الكروت
                childAspectRatio:
                    0.6, // 👈 نسبة العرض إلى الارتفاع (العرض/الارتفاع).
                // القيمة 0.7 تضمن أن الكارد أطول من عرضه، وهو مثالي لكروت المنتجات.
              ),
              itemBuilder: (context, index) {
                final product = state.products[index];

                return ProductCard(
                  id: product.id,
                  title: product.title,
                  price: product.price,
                  imageUrl: product.imageUrl,
                );
              },
            ),
          );
        } else if (state is ProductError) {
          return Center(
            child: Text(state.message, style: TextStyle(color: Colors.red)),
          );
        }
        return Text("Error");
      },
    );
  }
}
