import 'package:flutter/material.dart';
import 'package:lunchablez/pages/login_page.dart';
import 'package:lunchablez/pages/register_page.dart';

class LoginOrRegisterPag extends StatefulWidget {
  const LoginOrRegisterPag({super.key});

  @override
  State<LoginOrRegisterPag> createState() => _LoginOrRegisterPagState();
}

class _LoginOrRegisterPagState extends State<LoginOrRegisterPag> {
  //inital start show login page
  bool showLoginPage = true;

// toogle between login n regi
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        onTap: togglePages,
      );
    } else {
      return RegisterPage(
        onTap: togglePages,
      );
    }
  }
}
