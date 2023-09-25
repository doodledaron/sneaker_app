import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/cart_item.dart';
import '../models/cart.dart';
import '../models/shoe.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, value, child) {
      return Column(
        children: [
          SizedBox(
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Text(
              'My Cart',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            //this is the part where it needs to listen to changes
            child: ListView.builder(
              itemCount: value.getUserCartList().length,
              itemBuilder: (context, index) {
                Shoe individualShoe = value.getUserCartList()[index];
                return CartItem(individualShoe);
              },
            ),
          )
        ],
      );
    });
  }
}
