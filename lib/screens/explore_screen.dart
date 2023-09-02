import 'package:flutter/material.dart';

import '../models/models.dart';
import '../services/mock_service.dart';
import '../widgets/widgets.dart';

class ExploreScreen extends StatelessWidget {
  final mockService = MockService();

  ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: mockService.getExploreData(),
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView(
            scrollDirection: Axis.vertical,
            children: [
              TodayRecipeListView(
                recipes: snapshot.data?.todayRecipes ?? [],
              ),
              const SizedBox(
                height: 16,
              ),
              FriendPostListView(friendPosts: snapshot.data?.friendPosts ?? [])
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
