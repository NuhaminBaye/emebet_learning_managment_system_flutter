import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';

class CourseTabs extends StatelessWidget {
  final TabController tabController;

  const CourseTabs({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFFE5E7EB))),
      ),
      child: TabBar(
        controller: tabController,
        labelColor: AppColors.primary,
        unselectedLabelColor: AppColors.grey600,
        indicatorColor: AppColors.primary,
        indicatorWeight: 3,
        labelStyle: AppTextTheme.bodyMedium.copyWith(fontWeight: FontWeight.w600),
        tabs: const [
          Tab(text: "Overview"),
          Tab(text: "Lessons"),
          Tab(text: "Reviews"),
        ],
      ),
    );
  }
}