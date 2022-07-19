import 'package:flutter/material.dart';
import 'package:pokedex/homepage.dart';

void main() {
  runApp(Pokedex());
}

class Pokedex extends StatelessWidget {
  const Pokedex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
