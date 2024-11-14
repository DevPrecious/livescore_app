import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class LeagueCardWidget extends StatelessWidget {
  const LeagueCardWidget(
      {super.key, required this.title, required this.imageUrl});
  final String title;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(7.0),
        child: Column(
          children: [
            CachedNetworkImage(imageUrl: imageUrl, width: 50, height: 50),
            Text(title)
          ],
        ),
      ),
    );
  }
}
