import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:loja/models/product.dart';
import 'package:loja/models/product_list.dart';
import 'package:provider/provider.dart';

import '../components/product_grid.dart';
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
          child: ProductGrid(),
        ));
  }
}
