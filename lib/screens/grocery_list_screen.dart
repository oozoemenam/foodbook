import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/app_state_manager.dart';
import '../models/grocery_manager.dart';
import '../widgets/grocery_tile.dart';

class GroceryListScreen extends StatelessWidget {
  final GroceryManager manager;

  const GroceryListScreen({
    super.key,
    required this.manager
  });

  @override
  Widget build(BuildContext context) {
    final groceryItems = manager.groceryItems;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
        itemCount: groceryItems.length,
        itemBuilder: (context, index) {
          final item = groceryItems[index];

          // TODO: Wrap
          return Dismissible(
            key: Key(item.id),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              child: const Icon(
                Icons.delete_forever,
                color: Colors.white,
                size: 50.0,
              ),
            ),
            onDismissed: (direction) {
              manager.deleteItem(index);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${item.name} dismissed'))
              );
            },
            child: InkWell(
              child: GroceryTile(
                key: Key(item.id),
                item: item,
                onComplete: (change) {
                  if (change != null) {
                    manager.completeItem(index, change);
                  }
                },
              ),
              onTap: () {
                final itemId = manager.getItemId(index);
                context.goNamed(
                  'item',
                  pathParameters: {
                    'tab': '${SocialRecipeAppTab.toBuy}',
                    'id': itemId
                  },
                );
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => GroceryItemScreen(
                //       originalItem: item,
                //       onUpdate: (item) {
                //         manager.updateItem(item);
                //         Navigator.pop(context);
                //       },
                //       onCreate: (item) {
                //
                //       },
                //     )
                //   )
                // );
              },
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 16.0,);
        },
      ),
    );
  }
}
