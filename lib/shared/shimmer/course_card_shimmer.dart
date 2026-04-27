import 'package:flutter/material.dart';
import 'package:lms_mobileapp/shared/shimmer/base_shimmer.dart';

class CourseCardShimmer extends StatelessWidget {
  const CourseCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Container(
              height: 120,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            const SizedBox(height: 10),

            // Title
            Container(height: 14, width: double.infinity, color: Colors.grey),
            const SizedBox(height: 6),
            Container(height: 14, width: 150, color: Colors.grey),

            const SizedBox(height: 10),

            // Instructor
            Row(
              children: [
                CircleAvatar(radius: 10, backgroundColor: Colors.grey),
                const SizedBox(width: 8),
                Container(height: 12, width: 80, color: Colors.grey),
              ],
            ),
          ],
        ),
      ),
    );
  }
}