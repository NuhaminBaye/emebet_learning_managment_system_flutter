import 'package:flutter/material.dart';

class AppAvatar extends StatelessWidget {
  final String imageUrl;

  const AppAvatar({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: NetworkImage(imageUrl),
    );
  }
}