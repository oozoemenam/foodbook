import 'package:flutter/material.dart';
import 'package:foodbook/home.dart';
import 'package:foodbook/theme.dart';

void main() {
  runApp(const Foodbook());
}

class Foodbook extends StatelessWidget {
  const Foodbook({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = FoodbookTheme.dark();
    return MaterialApp(
      theme: theme,
      title: 'Foodbook',
      home: const Home(),
    );
  }


}
