import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home.dart';
import 'models/models.dart';
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
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => TabManager()),
            ChangeNotifierProvider(create: (context) => GroceryManager()),
          ],
          child: const Home(),
        ));
  }
}
