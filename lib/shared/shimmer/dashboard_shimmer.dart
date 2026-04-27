import 'package:flutter/material.dart';
import 'package:lms_mobileapp/shared/shimmer/base_shimmer.dart';
import 'package:lms_mobileapp/shared/shimmer/course_card_shimmer.dart';

class DashboardShimmer extends StatelessWidget {
  const DashboardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Column(
        children: [
          // Greeting
          Container(height: 20, width: 200, color: Colors.grey),
          const SizedBox(height: 16),

          // Stats cards
          Row(
            children: List.generate(2, (index) {
              return Expanded(
                child: Container(
                  margin: const EdgeInsets.all(8),
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              );
            }),
          ),

          const SizedBox(height: 20),

          // Course list
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (_, __) => const CourseCardShimmer(),
          )
        ],
      ),
    );
  }
}