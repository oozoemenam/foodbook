import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/models.dart';
import 'navigation/app_router.dart';
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
  late final _appRouter = AppRouter(
    widget.appStateManager,
    _profileManager,
    _groceryManager,
  );

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

          final router = _appRouter.router;
          return MaterialApp.router(
            theme: theme,
            title: 'SocialRecipeApp',
            routerDelegate: router.routerDelegate,
            routeInformationParser: router.routeInformationParser,
            routeInformationProvider: router.routeInformationProvider,
          );
        },
      ),
    );
  }
}
