import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lunchablez/kasi_pizza/ingredient.dart';

const _pizzaCartSize = 55.0;

class PizzaOrderDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //App bar

        appBar: AppBar(
          //app b tittle

          title: Text(
            'Pizza Ya Kasi',
            textAlign: TextAlign.center,
            style: GoogleFonts.notoSerif(
              color: Color.fromARGB(255, 223, 183, 6),
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),

          //App bar color
          backgroundColor: Colors.white,
          elevation: 0,

          //cart button
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.shopping_bag_outlined,
                    color: Color.fromARGB(255, 223, 172, 6)))
          ],
        ),

        //pizza body
        body: Stack(
          children: [
            Positioned.fill(
              bottom: 50,
              left: 10,
              right: 10,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 10,
                child: Column(
                  children: [
                    Expanded(
                      // pizza detailss
                      flex: 3,
                      child: _pizzaDetails(),
                    ),

                    //ingrid section
                    Expanded(
                      flex: 2,
                      child: _PizzaIngredients(),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 25,
              height: _pizzaCartSize,
              width: _pizzaCartSize,
              left: MediaQuery.of(context).size.width / 2 - _pizzaCartSize / 2,
              child: _PizzaCartButton(),
            ),
          ],
        ));
  }
}

/////////////////////////////////Pizza Details///////////////

class _pizzaDetails extends StatefulWidget {
  @override
  State<_pizzaDetails> createState() => _pizzaDetailsState();
}

class _pizzaDetailsState extends State<_pizzaDetails> {
  // list ingrid array
  final _listIngredient = <Ingredient>[];
  bool _focused = false;
  //pizza prize
  int _total = 20;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: DragTarget<Ingredient>(
            onAccept: (ingredient) {
              print('accept');
            },
            onWillAccept: (ingredient) {
              print("OnwillAccept");
              setState(() {
                _focused = true;
                _total++;
              });
              //for state
              for (Ingredient i in _listIngredient) {
                if (i.compare(ingredient!)) {
                  return false;
                }
              }
              _listIngredient.add(ingredient!);
              return true;
            },
            onLeave: (ingredient) {
              print('onLeave');
              setState(() {
                _focused = false;
              });
            },
            builder: (context, list, rejects) {
              //lay with stream o layout builder
              return LayoutBuilder(builder: (context, constraints) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  height: _focused
                      ? constraints.maxHeight
                      : constraints.maxWidth - 10,
                  child: Stack(
                    children: [
                      // Pizza dish holder

                      Image.asset('lib/assets/pizza_ods/dish.png'),
                      //pizza
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset('lib/assets/pizza_ods/pizza-1.png'),
                      ),
                    ],
                  ),
                );
              });
            },
          ),
        ),

        const SizedBox(
          height: 6,
        ),

        ///Amount
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 800),
          /*transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                  position: animation.drive(Tween<Offset>(
                      begin: Offset(0.0, 0.0),
                      end: Offset(
                        0.0,
                        0.0,
                        animation.value,
                      ),
                      ),
                      
                      
                      )
                      ),
                      child: child,
            );          },*/
          child: Text(
            '\P $_total',
            key: Key(_total.toString()),
            style: GoogleFonts.abyssinicaSil(
              color: Color.fromARGB(255, 223, 183, 6),
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}

///////pizaaa go to cart button

class _PizzaCartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 17, 198, 230).withOpacity(0.5),
                Colors.blue,
              ])),
      child: Icon(
        Icons.shopping_basket_outlined,
        color: Colors.white,
        size: 40,
      ),
    );
  }
}

///////////PIZZZA INGRIDIENTS//////////

class _PizzaIngredients extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Ingredients.length,
        itemBuilder: (context, index) {
          final ingredient = Ingredients[index];
          return _pizzaIngredientItems(ingredient: ingredient);
        },
      ),
    );
  }
}

//////////////_pizza Ingrid items//////

class _pizzaIngredientItems extends StatelessWidget {
  const _pizzaIngredientItems({Key? key, required this.ingredient})
      : super(key: key);

  ///inits
  final Ingredient ingredient;
  @override
  Widget build(BuildContext context) {
    //final containr
    final child = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7.0),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 230, 178, 7),
          shape: BoxShape.circle,
        ),
        //ingredient images

        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset(
            ingredient.image,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
    return Draggable(
      feedback: child,
      data: ingredient,
      child: child,
    );
  }
}
