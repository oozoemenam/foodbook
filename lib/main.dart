import 'package:flutter/material.dart';
import 'package:foodbook/theme.dart';

void main() {
  runApp(const Foodbook());
}

class Foodbook extends StatelessWidget {
  const Foodbook({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = FoodbookTheme.dark();
    // TODO: Apply Home widget
    return MaterialApp(
      title: 'Foodbook',
      theme: theme,
      home: Scaffold(
        appBar: AppBar(title: Text('Foodbook', style: theme.textTheme.titleLarge,)),
        body: Center(child: Text('Let\'s get cooking!', style: theme.textTheme.displayLarge,)),
      )
    );
  }


}
