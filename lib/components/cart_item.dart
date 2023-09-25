import 'package:provider/provider.dart';
import 'package:sneaker_ap/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../models/cart.dart';

class CartItem extends StatefulWidget {
  final Shoe shoe;
  const CartItem(this.shoe);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  void deleteItem(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).deleteItemFromCart(shoe);
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10)),
            onPressed: (context) {
              deleteItem(widget.shoe);
            },
            backgroundColor: Colors.red,
            icon: Icons.delete_forever,
          ),
          SlidableAction(
            onPressed: null,
            backgroundColor: Colors.grey.shade700,
            foregroundColor: Colors.white,
            icon: Icons.info_rounded,
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(8)),
        child: ListTile(
          leading: Image.asset(widget.shoe.imagePath),
          title: Text(widget.shoe.name),
          subtitle: Text('\$${widget.shoe.price}'),
        ),
      ),
    );
  }
}
