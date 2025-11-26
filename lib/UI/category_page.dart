import 'package:ecommerce_app/UI/categoryContainer.dart';
import 'package:flutter/material.dart';

List<CategoryContainer> categories = [
  CategoryContainer(
    categoryName: 'men\'s clothing',
    imageUrl:
        'https://cdn.shopify.com/s/files/1/0108/7802/files/Summer_outfit-2.jpg',
    nameIsLeft: true,
  ),
  CategoryContainer(
    categoryName: 'women\'s clothing',
    imageUrl:
        'https://media.istockphoto.com/id/1208148708/photo/polka-dot-summer-brown-dress-suede-wedge-sandals-eco-straw-tote-bag-cosmetics-on-a-light.jpg?s=612x612&w=0&k=20&c=9Y135GYKHLlPotGIfynBbMPhXNbYeuDuFzreL_nfDE8=',
    nameIsLeft: false,
  ),
  CategoryContainer(
    categoryName: 'jewelery',
    imageUrl:
        'https://t4.ftcdn.net/jpg/04/47/91/41/360_F_447914195_XdcRh5miaqdCGBsHKM87zSCDDBfOwWkO.jpg',
    nameIsLeft: true,
  ),
  CategoryContainer(
    categoryName: 'electronics',
    imageUrl:
        'https://img.freepik.com/free-photo/modern-stationary-collection-arrangement_23-2149309649.jpg?semt=ais_hybrid&w=740&q=80',
    nameIsLeft: false,
  ),
];

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: categories);
  }
}
