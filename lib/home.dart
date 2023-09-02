import 'package:flutter/material.dart';

import 'screens/explore_screen.dart';
import 'screens/recipes_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static List<Widget> screens = <Widget>[
    ExploreScreen(),
    RecipesScreen(),
    // const Card3(),
    Container(color: Colors.blue),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SocialRecipeApp',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Recipes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'To Buy',
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
