import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';

class CourseTabs extends StatelessWidget {
  final TabController tabController;
  final List<String> labels;

  const CourseTabs({
    super.key,
    required this.tabController,
    this.labels = const ['Overview', 'Lessons', 'Reviews'],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
        child: TabBar(
          controller: tabController,
          labelColor: AppColors.primary,
          unselectedLabelColor: AppColors.grey600,
          indicatorColor: AppColors.primary,
          indicatorWeight: 2.6,
          indicatorSize: TabBarIndicatorSize.tab,
          labelStyle: AppTextTheme.bodyMedium.copyWith(fontWeight: FontWeight.w700),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          dividerColor: Colors.transparent,
          tabs: labels.map((label) => Tab(text: label)).toList(growable: false),
        ),
      ),
    );
  }
}