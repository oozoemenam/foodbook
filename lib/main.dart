import 'package:flutter/material.dart';

import 'home.dart';
import 'theme.dart';

void main() {
  runApp(const SocialRecipeApp());
}

class SocialRecipeApp extends StatelessWidget {
  const SocialRecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = SocialRecipeAppTheme.dark();
    return MaterialApp(
      theme: theme,
      title: 'SocialRecipeApp',
      home: const Home(),
    );
  }
}
