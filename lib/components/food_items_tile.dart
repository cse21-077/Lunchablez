import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lunchablez/cafe/coffee_list.dart';

class FoodItemTile extends StatelessWidget {
  //Tile items
  final String shopName;
  final String imagePath;
  final color;
  final Widget nav;

  //void Function()? onPressed;

  FoodItemTile(
      {
      // add requiremenst
      //required this.onPressed,
      required this.shopName,
      required this.imagePath,
      required this.color,
      required this.nav,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          //image
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              imagePath,
              height: 64,
            ),
          ),

          //Shop_Name
          Text(shopName),

          //ontap

          //button
          MaterialButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => nav,
                ),
              );
            },
            color: color[800],
            child: Text(
              "Place Order",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )
        ]),
      ),
    );
  }
}
