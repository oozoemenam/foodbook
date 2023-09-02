import 'package:flutter/material.dart';

import 'home.dart';
import 'theme.dart';

void main() {
  runApp(const Platemate());
}

class Platemate extends StatelessWidget {
  const Platemate({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = PlatemateTheme.dark();
    return MaterialApp(
      theme: theme,
      title: 'Platemate',
      home: const Home(),
    );
  }
}
