import 'dart:math';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

double _doubleInRange(Random source, num start, num end) =>
    source.nextDouble() * (end - start) + start;

//Initialzz

final random = Random();
final coffees = List.generate(
  _names.length,
  (index) => Coffee(
    image: 'lib/assets/coffee/${index + 1}.png',
    name: _names[index],
    price: _doubleInRange(random, 4, 8), //assigning price in randomm intervals
  ),
);

class Coffee {
  Coffee({
    required this.name,
    required this.image,
    required this.price,
  });

  //stings int
  final String name;
  final String image;
  final double price;
}

final _names = [
  'Iced Creamy Coffee',
  'Caramel Latte',
  'Toffee Nut Latte',
  'Capuchino',
  'Toffe Nut Ice Latte',
  'Americano',
  'Caramel Macchiato',
  'Iced Tea',
  'Black Tea Latte',
  'Classic Irish Coffee',
  'Toffee Nut Crunch Latte',
  'Coke',
  'Pepsi Cola',
  'white choco bun',
  'Crossiant',
  'Soft Donut',
];
