import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/shoe_tile.dart';
import '../models/cart.dart';
import '../models/shoe.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    void addItemToCart(Shoe shoe) {
      Provider.of<Cart>(context, listen: false).addItemToCart(shoe);
      showDialog(
          context: context,
          builder: (builder) => AlertDialog(
                title: Text('Succesfully added to cart'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('okay'))
                ],
              ));
    }

    return Column(
      children: [
        // Search bar
        SizedBox(
          height: 80,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Search',
                style: TextStyle(color: Colors.grey),
              ),
              Icon(
                Icons.search,
                color: Colors.grey,
              )
            ],
          ),
        ),

        //show message
        Padding(
          padding: EdgeInsets.symmetric(vertical: 25),
          child: Text(
            'everyone flies...some flies longer than others',
            style: TextStyle(color: Colors.grey),
          ),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Hot picks🔥',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                'See all',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),

        //hot pick
        Consumer<Cart>(builder: (context, value, child) {
          return Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: value.getShopList().length,
              itemBuilder: (context, index) {
                Shoe shoe = value.getShopList()[index];
                return ShoeTile(
                  onTap: () {
                    addItemToCart(shoe);
                  },
                  shoe: shoe,
                );
              },
            ),
          );
        }),

        Padding(
          padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
          child: Divider(
            thickness: 2,
            color: Colors.grey[100],
          ),
        )
      ],
    );
  }
}
