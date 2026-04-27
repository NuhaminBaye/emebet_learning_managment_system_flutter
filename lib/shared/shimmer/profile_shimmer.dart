import 'package:flutter/material.dart';
import 'package:lms_mobileapp/shared/shimmer/base_shimmer.dart';
class ProfileShimmer extends StatelessWidget {
  const ProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Column(
        children: [
          const SizedBox(height: 20),

          CircleAvatar(radius: 40, backgroundColor: Colors.grey),
          const SizedBox(height: 10),

          Container(height: 14, width: 120, color: Colors.grey),
          const SizedBox(height: 6),
          Container(height: 12, width: 180, color: Colors.grey),
        ],
      ),
    );
  }
}