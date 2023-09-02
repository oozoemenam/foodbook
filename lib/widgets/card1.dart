import 'package:flutter/material.dart';

import '../models/models.dart';
import '../theme.dart';

class Card1 extends StatelessWidget {
  final ExploreRecipe recipe;

  const Card1({super.key, required this.recipe});

  final String category = 'Editor\'s Choice';
  final String title = 'The Art of Dough';
  final String description = 'Learn to make the perfect bread';
  final String chef = ' — Bruce Wayne';

  @override
  Widget build(BuildContext context) {
    return Center(
        // TODO: Card1 decorate container
        child: Container(
      padding: const EdgeInsets.all(16),
      constraints: const BoxConstraints.expand(width: 350, height: 450),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/1.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Stack(
        children: [
          Text(
            category,
            style: PlatemateTheme.darkTextTheme.bodyLarge,
          ),
          Positioned(
            top: 20,
            child: Text(
              title,
              style: PlatemateTheme.darkTextTheme.displayMedium,
            ),
          ),
          Positioned(
            bottom: 40,
            right: 0,
            child: Text(
              description,
              style: PlatemateTheme.darkTextTheme.bodyLarge,
            ),
          ),
          Positioned(
            bottom: 20,
            right: 0,
            child: Text(
              chef,
              style: PlatemateTheme.darkTextTheme.bodyLarge,
            ),
          ),
        ],
      ),
    ));
  }
}
