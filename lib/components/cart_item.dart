import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';
import '../models/cart_item.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem item;

  CartItemWidget(this.item);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(item.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          size: 35,
          color: Colors.white,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
      ),
      onDismissed: (_) {
        Provider.of<Cart>(context, listen: false).removeItem(item.productId);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: ListTile(
              leading: CircleAvatar(
                  child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: FittedBox(
                  child: Text("${item.price}"),
                ),
              )),
              title: Text(item.title),
              subtitle: Text("R\$ ${item.price * item.quantity}"),
              trailing: Text("${item.quantity}x"),
            ),
          ),
        ),
      ),
    );
  }
}
