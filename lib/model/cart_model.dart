import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lunchablez/cafe/coffee_list.dart';
import 'package:lunchablez/kasi_pizza/pizza_order_details.dart';
import 'package:lunchablez/pages/cart_page.dart';
import 'package:lunchablez/pages/home_page.dart';
import 'package:lunchablez/pages/intro_page.dart';

class CartModel extends ChangeNotifier {
  // List of Shops Tiles

  final List _shopList = [
    // {shopName , imagepath, color , navigation page}
    ["Mafresh", "lib/images/maflogo.png", Colors.red, CoffeeList()],
    ["The Pantry", "lib/images/pantry.jpg", Colors.pink, HomePage()],
    [
      "Pizza Ya Kasi",
      "lib/images/kasipiz.jpg",
      Colors.orange,
      PizzaOrderDetails()
    ],
    ["BAC Cafe", "lib/images/Bac_coffe.png", Colors.teal, CoffeeList()],
  ];

  //List _cartItems = [];

  get shopList => _shopList;

  /*// get CartItems => _cartItems;

  //add item to cart
  //void addItemToCart(int index) {
    _cartItems.add(_shopList[index]);
    notifyListeners();
  }

  //remove item from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // calculate total
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
*/
}
