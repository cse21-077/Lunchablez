import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:lunchablez/pages/home_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.959),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 190,
                ),
                Center(
                  child: Lottie.asset(
                    "lib/assets/man.json",
                    height: 300,
                    width: 300,
                    fit: BoxFit.fill,
                  ),
                ),

                SizedBox(
                  height: 10,
                ),
                //box with words

                Container(
                  padding:
                      EdgeInsets.only(bottom: 50, left: 40, top: 40, right: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 233, 233, 216),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("You Order` We Deliver to Your \nDoorstep.🍜",
                          style: GoogleFonts.notoSerif(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      //seond txta
                      Text(
                        "Meals Made Easy.",
                        style: GoogleFonts.pontanoSans(
                          fontSize: 24,
                          color: Color.fromARGB(255, 59, 59, 59),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          HomePage()));
                            },
                            child: Text(
                              "Get Started",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 212, 164, 6),
                                  fontSize: 18),
                            )),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
