import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lunchablez/components/food_items_tile.dart';
import 'package:lunchablez/model/cart_model.dart';
import 'package:lunchablez/pages/cart_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //cart button start
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return HomePage();
          }),
        ),
        backgroundColor: Colors.black,
        child: Icon(Icons.shopping_bag),
      ),

      //cart btn end
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //space above
            const SizedBox(
              height: 60,
            ),
            //Good Morning
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text("Good Afternoon,"),
            ),

            const SizedBox(
              height: 4,
            ),

            //Lets Order Lunch
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Lets Order Up A Delicious Meal..📍",
                style: GoogleFonts.notoSerif(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(
              height: 24,
            ),

            //divider
            // const Padding(
            // padding: EdgeInsets.symmetric(horizontal: 24.0),
            // child: Divider(),
            //),

            // const SizedBox(
            //  height: 20,
            //),

            //fresh item + grid
            //const Padding(
            //padding: EdgeInsets.symmetric(horizontal: 24.0),
            //child: Text(
            //  "Tasty Treats🤤",
            // style: TextStyle(
            //   fontSize: 16,
            //),
            // ),
            // ),

            Expanded(child: Consumer<CartModel>(
              builder: (context, value, child) {
                // griddddd
                return GridView.builder(
                    itemCount: value.shopList.length,
                    padding: EdgeInsets.all(12),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          2, //how many buttons in a row n we gave it 2
                      childAspectRatio: 1 / 1.3,
                    ),
                    itemBuilder: (context, index) {
                      return FoodItemTile(
                        shopName: value.shopList[index][0],
                        imagePath: value.shopList[index][1],
                        color: value.shopList[index][2],
                        nav: value.shopList[index][3],
                        //onPressed: () {
                        // Provider.of<CartModel>(context, listen: false)
                        // .addItemToCart(index);
                        // }
                      );
                    });
              },
            )),
          ],
        ),
      ),
    );
  }
}
