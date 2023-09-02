import 'package:flutter/material.dart';

import '../models/models.dart';
import '../theme.dart';
import 'widgets.dart';

class Card2 extends StatelessWidget {
  final ExploreRecipe recipe;

  const Card2({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(
          width: 350,
          height: 450,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/5.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Column(
          children: [
            const AuthorCard(
              authorName: 'Bruce Wayne',
              title: 'Smoothie Connoisseur',
              imageProvider: AssetImage('assets/Bruce_Wayne.jpg'),
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: Text(
                      'Recipe',
                      style: SocialRecipeAppTheme.lightTextTheme.displayLarge,
                    ),
                  ),
                  Positioned(
                    bottom: 70,
                    left: 16,
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        'Smoothies',
                        style: SocialRecipeAppTheme.lightTextTheme.displayLarge,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
