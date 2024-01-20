import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lunchablez/pages/home_page.dart';
import 'package:lunchablez/pages/intro_page.dart';
import 'package:lunchablez/pages/login_or_register.dart';
import 'package:lunchablez/pages/login_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //user is logged in
          if (snapshot.hasData) {
            return IntroPage();
          }

          // user not loggged in
          else {
            return LoginOrRegisterPag();
          }
        },
      ),
    );
  }
}
