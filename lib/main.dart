import 'package:ecommerce_app/UI/homeScreen.dart';
import 'package:ecommerce_app/cubit/product_cubit.dart';
import 'package:ecommerce_app/services/products_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(ProductsRepository())..getProducts(),
      child: MaterialApp(home: Homescreen()),
    );
  }
}
