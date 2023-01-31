import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:loja/models/product.dart';
import 'package:loja/models/product_list.dart';
import 'package:provider/provider.dart';

import '../components/product_item.dart';
import '../data/dummy_data.dart';

class ProductsOverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    final List<Product> loadedProducts = provider.items;
    return Scaffold(
        appBar: AppBar(
          title: Text("Minha Loja"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(
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
              }),
        ));
  }
}
