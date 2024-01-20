import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:lunchablez/components/my_button.dart';
import 'package:lunchablez/components/my_textfield.dart';
import 'package:lunchablez/components/square_tile.dart';

class RegisterPage extends StatefulWidget {
  //register on tap
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //textf edit cotrollers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  //sign up user methods
  void signUserUp() async {
    //loading circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    //creating uuser acount

    try {
      //check if pass match
      if (passwordController.text == confirmpasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        // show non matching error
        errorMessage("Passwords do not match");
      }

      // stop loading
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // stop loading
      Navigator.pop(context);

      //show error message
      errorMessage(e.code);
    }
  }

  // Pop Ups

  //error messae
  void errorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white),
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

                const Text(
                  'Crate an account Luncher',
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

                //confirm pass field
                MyTextfield(
                  controller: confirmpasswordController,
                  hintText: 'Confirm Password',
                  obsecureText: true,
                ),

                const SizedBox(
                  height: 10,
                ),

                //sign up
                MyButton(
                  text: "Sign Up.",
                  onTap: signUserUp,
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
                  children: const [
                    //google btn
                    SquareTile(imagePath: 'lib/images/gl.png'),

                    SizedBox(width: 25),

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
                      'Already have an account?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Login',
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
