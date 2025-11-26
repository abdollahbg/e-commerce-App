import 'package:ecommerce_app/UI/categoryContainer.dart';
import 'package:flutter/material.dart';

List<CategoryContainer> categories = [
  CategoryContainer(
    categoryName: 'men\'s clothing',
    imageUrl: 'https://m.media-amazon.com/images/I/61Rb+rv0lNL._SX679_.jpg',
    nameIsLeft: true,
  ),
];

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: categories);
  }
}
