import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../models/product.dart';
import '../utils/app_routes.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
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
                icon: Icon(Icons.favorite),
                color: (product.isFavorite)
                    ? Theme.of(context).accentColor
                    : Colors.white,
                onPressed: () {
                  product.toggleFavorite;
                },
              ),
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
