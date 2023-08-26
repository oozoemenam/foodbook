import 'package:flutter/material.dart';
import 'package:foodbook/theme.dart';

class Card1 extends StatelessWidget {
  const Card1({super.key});

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
            style: FoodbookTheme.darkTextTheme.bodyLarge,
          ),
          Positioned(
            top: 20,
            child: Text(
              title,
              style: FoodbookTheme.darkTextTheme.displayMedium,
            ),
          ),
          Positioned(
            bottom: 40,
            right: 0,
            child: Text(
              description,
              style: FoodbookTheme.darkTextTheme.bodyLarge,
            ),
          ),
          Positioned(
            bottom: 20,
            right: 0,
            child: Text(
              chef,
              style: FoodbookTheme.darkTextTheme.bodyLarge,
            ),
          ),
        ],
      ),
    ));
  }
}
