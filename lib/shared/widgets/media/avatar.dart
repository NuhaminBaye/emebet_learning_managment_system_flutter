import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';

class AppAvatar extends StatelessWidget {
  final String imageUrl;
  final double size;

  const AppAvatar({super.key, required this.imageUrl, this.size = 48});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size / 2,
      backgroundColor: AppColors.grey100,
      backgroundImage: NetworkImage(imageUrl),
    );
  }
}