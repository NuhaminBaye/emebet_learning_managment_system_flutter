import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';

class AppAvatar extends StatelessWidget {
  final String imageUrl;
  final double size;

  const AppAvatar({super.key, required this.imageUrl, this.size = 48});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: size,
        height: size,
        fit: BoxFit.cover,
        errorWidget: (context, url, error) => Container(
          width: size,
          height: size,
          color: AppColors.grey200,
          alignment: Alignment.center,
          child: Text(
            'A',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: size * 0.38,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        placeholder: (context, url) => Container(
          width: size,
          height: size,
          color: AppColors.grey100,
        ),
      ),
    );
  }
}