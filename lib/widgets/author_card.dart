import 'package:flutter/material.dart';
import '../theme.dart';

import 'circle_image.dart';

class AuthorCard extends StatefulWidget {
  final String authorName;
  final String title;
  final ImageProvider? imageProvider;

  const AuthorCard({
    super.key,
    required this.authorName,
    required this.title,
    this.imageProvider
  });

  @override
  State<AuthorCard> createState() => _AuthorCardState();
}

class _AuthorCardState extends State<AuthorCard> {
  final bool _isFavorite = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleImage(
                  imageProvider: widget.imageProvider,
                  imageRadius: 28,
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.authorName,
                      style: PlatemateTheme.lightTextTheme.bodyLarge,
                    ),
                    Text(
                      widget.title,
                      style: PlatemateTheme.lightTextTheme.bodyMedium,
                    ),
                  ],
                )
              ],
            ),
            IconButton(
              icon: Icon(_isFavorite ? Icons.favorite : Icons.favorite_border),
              iconSize: 30,
              color: Colors.red[400],
              onPressed: () {
                setState(() {
                  _isFavorite: !_isFavorite;
                });
              },
            )
          ]
      ),
    );
  }
}
