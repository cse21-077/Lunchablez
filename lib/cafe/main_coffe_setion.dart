import 'package:flutter/material.dart';
import 'package:lunchablez/cafe/coffee_list.dart';

class MainCoffee extends StatelessWidget {
  const MainCoffee({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: CoffeeList(),
    );
  }
}
