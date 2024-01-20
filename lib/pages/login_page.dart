import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:lunchablez/components/my_button.dart';
import 'package:lunchablez/components/my_textfield.dart';
import 'package:lunchablez/components/square_tile.dart';

class LoginPage extends StatefulWidget {
  //register on tap
  final Function()? onTap;
  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //textf edit cotrollers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  //sign in user methods
  void signUserIn() async {
    //loading circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    //sign in

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // stop loading
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // stop loading
      Navigator.pop(context);

      //show error message
      ErrorMessage(e.code);
    }
  }

  // Pop Ups

  //error messae
  void ErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
              child: Text(
                message,
                style: TextStyle(color: Color.fromARGB(255, 23, 168, 197)),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 245, 245),
      body: SafeArea(
        //makes ui avoid other areas
        child: SingleChildScrollView(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                // app Logo

                Container(
                  child: Lottie.asset(
                    "assets/fod.json",
                    height: 150,
                    width: 150,
                    fit: BoxFit.fill,
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),

                //Welcome back text

                Text(
                  'Welcome back Luncher',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),

                //User textfield
                MyTextfield(
                  controller: emailController,
                  hintText: 'Email',
                  obsecureText: false,
                ),

                const SizedBox(
                  height: 10,
                ),

                //pass field
                MyTextfield(
                  controller: passwordController,
                  hintText: 'Password',
                  obsecureText: true,
                ),

                const SizedBox(
                  height: 10,
                ),

                // forgort pass

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                //sign in
                MyButton(
                  text: "Sign In",
                  onTap: signUserIn,
                ),
                const SizedBox(
                  height: 20,
                ),

                //continue with text
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                          child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //google facebook sign in
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //google btn
                    SquareTile(imagePath: 'lib/images/gl.png'),

                    const SizedBox(width: 25),

                    //fb btn
                    SquareTile(imagePath: 'lib/images/fb.png')
                  ],
                ),

                const SizedBox(
                  height: 5,
                ),

                //register
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a Member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Register Now',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
