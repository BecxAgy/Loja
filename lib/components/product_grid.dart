import 'package:flutter/material.dart';
import 'package:loja/components/product_item.dart';

import '../data/dummy_data.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: dummyProducts.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //dois produtos por linha
          childAspectRatio: 3 / 2, //relação entre altura e largura
          crossAxisSpacing: 10, //espaçamento no eixo vertical
          mainAxisSpacing: 10, //espaçamento no eixo horizontal
        ),
        itemBuilder: (ctx, i) {
          return ProductItem(
            product: dummyProducts[i],
          );
        });
  }
}
