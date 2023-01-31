import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../utils/app_routes.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);

    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(AppRoutes.ProductDetails, arguments: product);
          },
          child: GridTile(
            child: Image.network(product.imageUrl, fit: BoxFit.cover),
            footer: GridTileBar(
              backgroundColor: Colors.black87,
              leading: IconButton(
                  icon: product.isFavorite
                      ? Icon(Icons.favorite)
                      : Icon(Icons.favorite_border),
                  color: Theme.of(context).accentColor,
                  onPressed: () => product.toggleFavorite()),
              title: Text(
                product.title,
                textAlign: TextAlign.center,
              ),
              trailing: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {},
                  color: Theme.of(context).accentColor),
            ),
          ),
        ));
  }
}
