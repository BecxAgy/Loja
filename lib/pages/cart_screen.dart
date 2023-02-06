import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:loja/models/order_list.dart';
import 'package:provider/provider.dart';

import '../components/cart_item.dart';
import '../models/cart.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of(context);
    final items = cart.items.values.toList();
    return Scaffold(
      appBar: AppBar(title: Text("Carrinho")),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(width: 8),
                    Chip(
                        backgroundColor: Theme.of(context).primaryColor,
                        label: Text(
                          "R\$${cart.totalAmount.toString()}",
                          style: TextStyle(
                              color: Theme.of(context)
                                  .primaryTextTheme
                                  .headline6
                                  ?.color),
                        )),
                    Spacer(),
                    TextButton(
                        onPressed: () {
                          Provider.of<OrderList>(context, listen: false)
                              .addOrder(cart);

                          cart.clear();
                        },
                        child: Text(
                          "COMPRAR",
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ))
                  ]),
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (ctx, i) => CartItemWidget(items[i])))
        ],
      ),
    );
  }
}
