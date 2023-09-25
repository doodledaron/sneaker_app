import 'package:flutter/material.dart';
import 'shoe.dart';

class Cart extends ChangeNotifier {
  //all the shoes
  List<Shoe> shoeShop = [
    Shoe(
        name: 'Dunk Low Retro',
        price: '600',
        imagePath: 'images/dunkLowRetro.png',
        description: 'A retro dunk low'),
    Shoe(
        name: 'Jordan Retro Low',
        price: '700',
        imagePath: 'images/jordanRetroLow.png',
        description: 'Retro but why not go low?'),
    Shoe(
        name: 'Jordan Series ES',
        price: '800',
        imagePath: 'images/jordanSeriesES.png',
        description: 'Jordan ES u know what i mean?'),
    Shoe(
        name: 'Waffle',
        price: '699',
        imagePath: 'images/waffle.png',
        description: 'waffle waffle with banana ice cream'),
    Shoe(
        name: 'Waffle One',
        price: '699',
        imagePath: 'images/waffleOne.png',
        description: 'waffle waffle with 1 1 1 1 '),
    Shoe(
        name: 'Zoom',
        price: '899',
        imagePath: 'images/zoom.png',
        description: 'zoom in zoom out zoom in zoom out'),
  ];

  List<Shoe> userCart = [];

  //get the list of shoes to sell
  List<Shoe> getShopList() {
    return shoeShop;
  }

//get the userCart list
  List<Shoe> getUserCartList() {
    return userCart;
  }

//add item into user cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

//remove item from user cart
  void deleteItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
