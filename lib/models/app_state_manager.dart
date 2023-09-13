import 'dart:async';

import 'package:flutter/material.dart';

import 'app_cache.dart';

// AppStateManager mocks the various app state such as app initialization,
// app login, and onboarding.
class AppStateManager extends ChangeNotifier {
  // Checks to see if the user is logged in
  bool _loggedIn = false;
  // Checks to see if the user has completed onboarding
  bool _onboardingComplete = false;
  // Records the current tab the user is on.
  int _selectedTab = SocialRecipeAppTab.explore;
  // Stores user state properties on platform specific file system.
  final _appCache = AppCache();

  int get getSelectedTab => _selectedTab;
  // Property getters.
  bool get isLoggedIn => _loggedIn;
  bool get isOnboardingComplete => _onboardingComplete;

  void goToRecipes() {
    _selectedTab = SocialRecipeAppTab.recipes;
    notifyListeners();
  }

  void goToTab(index) {
    _selectedTab = index;
    notifyListeners();
  }

  // Initializes the app
  Future<void> initializeApp() async {
    // Check if the user is logged in
    _loggedIn = await _appCache.isUserLoggedIn();
    // Check if the user completed onboarding
    _onboardingComplete = await _appCache.didCompleteOnboarding();
  }

  void login(String username, String password) async {
    _loggedIn = true;
    await _appCache.cacheUser();
    notifyListeners();
  }

  void logout() async {
    // Reset all properties once user logs out
    _loggedIn = false;
    _onboardingComplete = false;
    _selectedTab = 0;

    // Reinitialize the app
    await _appCache.invalidate();
    await initializeApp();
    notifyListeners();
  }

  void onboarded() async {
    _onboardingComplete = true;
    await _appCache.completeOnboarding();
    notifyListeners();
  }
}

class SocialRecipeAppTab {
  static const int explore = 0;
  static const int recipes = 1;
  static const int toBuy = 2;
}
