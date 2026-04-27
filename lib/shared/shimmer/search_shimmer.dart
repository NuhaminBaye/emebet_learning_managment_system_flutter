import 'package:flutter/material.dart';
import 'package:lms_mobileapp/shared/shimmer/base_shimmer.dart';
class SearchShimmer extends StatelessWidget {
  const SearchShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Column(
        children: [
          Container(
            height: 50,
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(12),
            ),
          ),

          Wrap(
            spacing: 8,
            children: List.generate(
              5,
              (_) => Container(
                width: 80,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}