import 'package:flutter/material.dart';
import 'package:lms_mobileapp/shared/shimmer/base_shimmer.dart';
class LessonShimmer extends StatelessWidget {
  const LessonShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        title: Container(height: 12, color: Colors.grey),
        subtitle: Container(height: 10, width: 100, color: Colors.grey),
      ),
    );
  }
}