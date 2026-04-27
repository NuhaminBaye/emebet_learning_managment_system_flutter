import 'package:flutter/material.dart';
import 'package:lms_mobileapp/shared/shimmer/base_shimmer.dart';
class NotificationShimmer extends StatelessWidget {
  const NotificationShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: ListTile(
        leading: CircleAvatar(backgroundColor: Colors.grey),
        title: Container(height: 12, color: Colors.grey),
        subtitle: Container(height: 10, width: 150, color: Colors.grey),
      ),
    );
  }
}