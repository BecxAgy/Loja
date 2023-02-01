import 'package:flutter/material.dart';
import 'package:loja/data/dummy_data.dart';

import 'product.dart';

//usando mixin
class ProductList with ChangeNotifier {
  final List<Product> _items = dummyProducts;

  //Disponibilizando um clone da lista de produtos por meio de um get
  List<Product> get items => [..._items];
  List<Product> get favoriteItems =>
      _items.where((prod) => prod.isFavorite).toList();

  //Método de adicionar produto na lista

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }
}
