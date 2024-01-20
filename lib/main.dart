import 'package:flutter/material.dart';
import 'package:lunchablez/model/cart_model.dart';
import 'package:lunchablez/pages/auth_page.dart';
import 'package:lunchablez/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: AuthPage()),
    );
  }
}
