import 'package:flutter/material.dart';
import 'package:loja/utils/app_routes.dart';
import 'package:provider/provider.dart';
import 'package:loja/components/badge.dart';
import '../components/product_grid.dart';
import '../models/cart.dart';

enum FilterOptions { Favorite, All }

class ProductsOverviewPage extends StatefulWidget {
  const ProductsOverviewPage({super.key});

  @override
  State<ProductsOverviewPage> createState() => _ProductsOverviewPageState();
}

class _ProductsOverviewPageState extends State<ProductsOverviewPage> {
  bool _showFavoriteOnly = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Minha Loja"),
          actions: [
            PopupMenuButton(
              itemBuilder: (_) => [
                PopupMenuItem(
                  child: Text("Somente Favoritos"),
                  value: FilterOptions.Favorite,
                ),
                PopupMenuItem(
                  child: Text("Todos"),
                  value: FilterOptions.All,
                )
              ],
              onSelected: (FilterOptions option) {
                setState(() {
                  if (option == FilterOptions.Favorite) {
                    _showFavoriteOnly = true;
                  } else {
                    _showFavoriteOnly = false;
                  }
                });
              },
            ),
            Consumer<Cart>(
              builder: (ctx, cart, child) => BadgeH(
                value: cart.itemCount.toString(),
                child: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.CART);
                  },
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ProductGrid(_showFavoriteOnly),
        ));
  }
}
