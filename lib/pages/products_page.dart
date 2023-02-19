import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:loja/components/app_drawer.dart';
import 'package:loja/components/product_item.dart';
import 'package:loja/models/product_list.dart';
import 'package:loja/utils/app_routes.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProductList products = Provider.of(context);

    Future<void> _refreshProducts(BuildContext context) {
      return Provider.of<ProductList>(context, listen: false).loadProducts();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerenciar Produtos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.PRODUCT_FORM);
            },
          )
        ],
      ),
      drawer: const AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: products.itemsCount,
            itemBuilder: (ctx, i) => Column(
              children: [
                ProductItem(products.items[i]),
                const Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
