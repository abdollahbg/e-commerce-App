import 'package:ecommerce_app/UI/login/login_screen.dart';
import 'package:ecommerce_app/cubit/cubit/cart_cubit.dart';
import 'package:ecommerce_app/cubit/product_cubit.dart';
import 'package:ecommerce_app/cubit/cubit/login_cubit.dart';
import 'package:ecommerce_app/services/Login_service.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit(LoginService())),
        BlocProvider(
          create: (context) =>
              ProductCubit(ProductsRepository())..getProducts(),
        ),
        BlocProvider(create: (context) => CartCubit()),
      ],
      child: MaterialApp(
        title: 'Ecommerce App',
        theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
        home: const LoginScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
