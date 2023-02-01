import 'package:flutter/material.dart';
import 'package:loja/components/product_item.dart';
import 'package:provider/provider.dart';

import '../data/dummy_data.dart';
import '../models/product.dart';
import '../models/product_list.dart';

class ProductGrid extends StatelessWidget {
  final bool showFavoriteOnly;

  ProductGrid(this.showFavoriteOnly);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);

    final List<Product> loadedProducts =
        (showFavoriteOnly) ? provider.favoriteItems : provider.items;

    return GridView.builder(
        itemCount: loadedProducts.length,
        // ignore: prefer_const_constructors
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //dois produtos por linha
          childAspectRatio: 3 / 2, //relação entre altura e largura
          crossAxisSpacing: 10, //espaçamento no eixo vertical
          mainAxisSpacing: 10, //espaçamento no eixo horizontal
        ),
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
              value: loadedProducts[i],
              child: ProductItem(),
            ));
  }
}
