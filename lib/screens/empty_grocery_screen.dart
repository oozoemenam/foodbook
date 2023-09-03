import 'package:flutter/material.dart';

class EmptyGroceryScreen extends StatelessWidget {
  const EmptyGroceryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Image.asset('assets/empty_list.png'),
              ),
            ),
            Text('No Groceries', style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Shopping for ingredients? \n'
              'Tap the + button to write them down',
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 16,
            ),
            MaterialButton(
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              color: Colors.green,
              onPressed: () {
                // Go to recipes tab
              },
              child: const Text('Browse Recipes'),
            )
          ],
        ),
      ),
    );
  }
}
