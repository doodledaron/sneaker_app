import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';

class MyBottomNavBar extends StatelessWidget {
  final Function(int)
      onTabChange; //whenever user choose the first tab, the index will be 0, and so on
  MyBottomNavBar({required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: GNav(
        mainAxisAlignment: MainAxisAlignment.center, //make it middle
        color: Colors.grey[400], //icon color
        activeColor: Colors.grey[700], //icon active color
        tabActiveBorder:
            Border.all(color: Colors.white), // when tab color when it is active
        tabBackgroundColor: Colors.grey.shade100, //tab active background color
        tabBorderRadius: 16,
        onTabChange: onTabChange!,
        tabs: [
          GButton(
            icon: Icons.home,
            text: 'Shop',
          ),
          GButton(
            icon: Icons.shopping_bag_rounded,
            text: 'Cart',
          )
        ],
      ),
    );
  }
}
