import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lunchablez/cafe/coffees.dart';
import 'package:lunchablez/pages/cart_page.dart';
import 'package:lunchablez/pages/home_page.dart';

//animed switch duration
const _duration = Duration(microseconds: 500);

class CoffeeList extends StatefulWidget {
  const CoffeeList({super.key});

  @override
  State<CoffeeList> createState() => _CoffeeListState();
}

class _CoffeeListState extends State<CoffeeList> {
  //selector

  String selectedCoffee = '';

  ///add to cart

  void addToCart() {
    if (selectedCoffee.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CartPage()),
      );
      setState(() {
        selectedCoffee = '';
      });
    }
  }

//controller imports
  final _pageCoffeeContoller = PageController(viewportFraction: 0.35);

  //text scroller
  final _pageTextContoller = PageController();

  double _currentPage = 0.0;
  double _textPage = 0.0;

  //scrollerbale item
  void _coffeeScrollistener() {
    //scroll coffe listner
    setState(() {
      //possible error area
      _currentPage = _pageCoffeeContoller.page!;
    });
  }

  void _textScrollListner() {
    _textPage = _currentPage;
  }

  @override
  void initState() {
    _pageCoffeeContoller.addListener(_coffeeScrollistener);
    //text scroll
    _pageTextContoller.addListener(_textScrollListner);
    super.initState();
  }

  @override
  void dispose() {
    _pageCoffeeContoller.removeListener(_coffeeScrollistener);
    _pageCoffeeContoller.dispose();

    //text sc disp
    //_pageTextContoller.removeListener();
    _pageTextContoller.dispose();
    super.dispose();
  }

  @override

  //main Coffee list-  showing all BAC coffee
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          //back button start
          leading: BackButton(
            color: Colors.black,
          ),

          //back btn end
          actions: [
            Spacer(), //push it to the side
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              ),
            ),
          ]

          //cart button st

          //cart btn end
          ),
      body: Stack(
        children: [
          Positioned(
            left: 20,
            right: 20,
            bottom: -size.height * 0.22,
            height: size.height * 0.3,
            //child box
            child: DecoratedBox(
                decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
              BoxShadow(
                color: Colors.brown,
                blurRadius: 90,
                offset: Offset.zero,
                spreadRadius: 45,
              )
            ])),
          ),
          //positioner

          Transform.scale(
            scale: 1.6,
            alignment: Alignment.bottomCenter,
            ////////////////////////////////// CHOOSING A COFFFE SECTION STARTS HERE WITH DIALOG BOXES SO E CHOOSE COFFE WE WANT USING A DOUBLE TAP  SEND TO  CART PAGE/////////

            child: GestureDetector(
              //ontap
              onTap: () {
                selectedCoffee = coffees as String;
              },
              child: PageView.builder(
                  controller: _pageCoffeeContoller,
                  scrollDirection: Axis.vertical,
                  itemCount: coffees.length + 1,

                  //if
                  onPageChanged: (value) {
                    if (value < coffees.length) {
                      _pageTextContoller.animateToPage(value,
                          duration: _duration, curve: Curves.easeOut);
                    }
                  },
                  itemBuilder: (context, index) {
                    //if stat
                    if (index == 0) {
                      return const SizedBox.shrink();
                    }
                    final coffee = coffees[index - 1];
                    final result = _currentPage - index + 1;
                    final value = -0.4 * result + 1;
                    final opacity = value.clamp(0.0, 1.0);
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Transform(
                          alignment: Alignment.bottomCenter,
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..translate(
                                0.0, // to help put it on the median cnter
                                size.height / 2.6 * (1 - value).abs())
                            ..scale(value),
                          child: Opacity(
                              opacity: opacity,
                              child: Image.asset(
                                coffee.image,
                                fit: BoxFit.fitHeight,
                              ))),
                    );
                  }),
            ),
          ),

          Positioned(
              left: 0,
              top: 0,
              right: 0,
              height: 100,
              child: Column(
                children: [
                  //exp widget
                  Expanded(
                      child: PageView.builder(
                          itemCount: coffees.length,
                          controller: _pageTextContoller,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final opacity =
                                (1 - (index - _textPage).abs()).clamp(0.0, 1.0);
                            return Opacity(
                              opacity: opacity,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  coffees[index].name,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.notoSerif(
                                    color: Colors.black,
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  /*TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                  ),*/
                                ),
                              ),
                            );
                          })),

                  //spacing
                  const SizedBox(
                    height: 15,
                  ),

                  //The Coffe Switter/////////////////////////////////////////////////////////

                  AnimatedSwitcher(
                    duration: _duration,
                    child: _currentPage.toInt() < coffees.length
                        ? Text(
                            "P" +
                                coffees[_currentPage.toInt()]
                                    .price
                                    .toStringAsFixed(2),
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                            ),
                            key: Key(coffees[_currentPage.toInt()].name),
                          )
                        : Text(
                            'nd of Products'), // to display a mssage if a user goes beyond products offered.
                  )
                ],
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addToCart,
        tooltip: 'Add to cart',
        backgroundColor: Color.fromARGB(255, 101, 209, 115),
        child: Icon(Icons.shopping_cart),
      ),
      backgroundColor: Color.fromARGB(255, 192, 143, 100),
    );
  }
}
