import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../models/cart_item.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem item;

  CartItemWidget(this.item);

  @override
  Widget build(BuildContext context) {
    return Text(item.title);
  }
}
