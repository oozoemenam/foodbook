import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/models.dart';
import 'screens/home.dart';
import 'screens/login_screen.dart';
import 'theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appStateManager = AppStateManager();
  await appStateManager.initializeApp();
  runApp(SocialRecipeApp(appStateManager: appStateManager));
}

class SocialRecipeApp extends StatefulWidget {
  final AppStateManager appStateManager;

  const SocialRecipeApp({
    super.key,
    required this.appStateManager
  });

  @override
  State<SocialRecipeApp> createState() => _SocialRecipeAppState();
}

class _SocialRecipeAppState extends State<SocialRecipeApp> {
  late final _groceryManager = GroceryManager();
  late final _profileManager = ProfileManager();
  // TODO: Initialize AppRouter

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => _groceryManager),
        ChangeNotifierProvider(create: (context) => _profileManager),
        ChangeNotifierProvider(create: (context) => widget.appStateManager),
      ],
      child: Consumer<ProfileManager>(
        builder: (context, profileManager, child) {
          ThemeData theme;
          if (profileManager.darkMode) {
            theme = SocialRecipeAppTheme.dark();
          } else {
            theme = SocialRecipeAppTheme.light();
          }

          // TODO: Replace with Router
          return MaterialApp(
            theme: theme,
            title: 'SocialRecipeApp',
            home: const LoginScreen(),
          );
        },
      ),
    );
  }
}
