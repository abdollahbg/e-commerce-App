import 'package:ecommerce_app/UI/category_page.dart';
import 'package:ecommerce_app/UI/home_page.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: const TabBar(
            tabs: [
              Tab(child: Text('Home')),
              Tab(child: Text('Category')),
            ],
          ),
        ),
        body: const TabBarView(children: [HomePage(), CategoryPage()]),
      ),
    );
  }
}
