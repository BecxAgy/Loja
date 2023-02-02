import 'package:flutter/material.dart';
import 'package:loja/models/product_list.dart';
import 'package:loja/pages/cart_screen.dart';
import 'package:loja/pages/product_details_page.dart';
import 'package:loja/pages/products_overview_page.dart';
import 'package:loja/utils/app_routes.dart';
import 'package:provider/provider.dart';

import 'models/cart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductList()),
        ChangeNotifierProvider(create: (_) => Cart()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.purple, accentColor: Colors.deepOrange),
        home: ProductsOverviewPage(),
        debugShowCheckedModeBanner: false,
        routes: {
          AppRoutes.ProductDetails: (ctx) => ProductDetailPage(),
          AppRoutes.CART: (ctx) => CartScreen(),
        },
      ),
    );
  }
}
