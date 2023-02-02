import 'dart:math';

import 'package:flutter/material.dart';
import 'package:loja/models/cart_item.dart';
import 'package:loja/models/product.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => {..._items};

  double get totalAmount {
    double total = 0;

    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });

    return total;
  }

  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(
          product.id,
          (existingItem) => CartItem(
              id: existingItem.id,
              productId: existingItem.productId,
              title: existingItem.title,
              quantity: existingItem.quantity + 1,
              price: existingItem.price));
    } else {
      _items.putIfAbsent(
          product.id,
          () => CartItem(
              id: Random().nextDouble().toString(),
              productId: product.id,
              title: product.title,
              quantity: 1,
              price: product.price));
    }
    notifyListeners();
  }

  void removeItem(String productid) {
    _items.remove(productid);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }

  int get itemCount => _items.length;
}
