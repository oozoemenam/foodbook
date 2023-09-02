import 'dart:developer';

import 'package:flutter/material.dart';
import '../models/models.dart';
import '../theme.dart';

class Card3 extends StatelessWidget {
  final ExploreRecipe recipe;

  const Card3({super.key, required this.recipe});

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
            image: AssetImage('assets/2.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.book,
                    color: Colors.white,
                    size: 40,
                  ),
                  const SizedBox(height: 8,),
                  Text(
                    'Recipe Trends',
                    style: PlatemateTheme.darkTextTheme.displayMedium,
                  ),
                  const SizedBox(height: 30,)
                ],
              ),
            ),
            Center(
              child: Wrap(
                alignment: WrapAlignment.start,
                spacing: 8,
                runSpacing: 8,
                children: [
                  Chip(
                    label: Text(
                      'Healthy',
                      style: PlatemateTheme.darkTextTheme.bodyLarge,
                    ),
                    backgroundColor: Colors.black.withOpacity(0.7),
                    onDeleted: () {
                      log('delete');
                    },
                  ),
                  Chip(
                    label: Text(
                      'Vegan',
                      style: PlatemateTheme.darkTextTheme.bodyLarge,
                    ),
                    backgroundColor: Colors.black.withOpacity(0.7),
                    onDeleted: () {
                      log('delete');
                    },
                  ),
                  Chip(
                    label: Text(
                      'Carrots',
                      style: PlatemateTheme.darkTextTheme.bodyLarge,
                    ),
                    backgroundColor: Colors.black.withOpacity(0.7),
                  ),
                  Chip(
                    label: Text(
                      'Greens',
                      style: PlatemateTheme.darkTextTheme.bodyLarge,
                    ),
                    backgroundColor: Colors.black.withOpacity(0.7),
                  ),
                  Chip(
                    label: Text(
                      'Wheat',
                      style: PlatemateTheme.darkTextTheme.bodyLarge,
                    ),
                    backgroundColor: Colors.black.withOpacity(0.7),
                  ),
                  Chip(
                    label: Text(
                      'Pescetarian',
                      style: PlatemateTheme.darkTextTheme.bodyLarge,
                    ),
                    backgroundColor: Colors.black.withOpacity(0.7),
                  ),
                  Chip(
                    label: Text(
                      'Mint',
                      style: PlatemateTheme.darkTextTheme.bodyLarge,
                    ),
                    backgroundColor: Colors.black.withOpacity(0.7),
                  ),
                  Chip(
                    label: Text(
                      'Lemongrass',
                      style: PlatemateTheme.darkTextTheme.bodyLarge,
                    ),
                    backgroundColor: Colors.black.withOpacity(0.7),
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
