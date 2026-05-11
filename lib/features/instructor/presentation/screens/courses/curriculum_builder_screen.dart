import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/constants/app_routes.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/spacing.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';
import 'package:lms_mobileapp/features/instructor/presentation/widgets/insight_card.dart';
import 'package:lms_mobileapp/features/instructor/presentation/widgets/lesson_card.dart';
import 'package:lms_mobileapp/features/instructor/presentation/widgets/primary_button.dart';

class CurriculumBuilderScreen extends StatefulWidget {
  final String courseId;
  final String courseName;
  final String courseDescription;

  const CurriculumBuilderScreen({
    super.key,
    this.courseId = 'course_1',
    this.courseName = 'Sustainable Design Principles 101',
    this.courseDescription = 'Curriculum Builder',
  });

  @override
  State<CurriculumBuilderScreen> createState() =>
      _CurriculumBuilderScreenState();
}

class _CurriculumBuilderScreenState extends State<CurriculumBuilderScreen> {
  // Mock data for lessons
  final List<Map<String, dynamic>> lessons = [
    {
      'id': '1',
      'title': 'Introduction to Minimalism',
      'type': 'VIDEO',
      'duration': '12:45',
      'commentCount': 12,
      'isDraft': false,
    },
    {
      'id': '2',
      'title': 'Color Theory & Emotion',
      'type': 'QUIZ',
      'duration': '15:00',
      'commentCount': 5,
      'isDraft': false,
    },
    {
      'id': '3',
      'title': 'Typography Essentials',
      'type': 'READING',
      'duration': '20:00',
      'commentCount': 0,
      'isDraft': true,
    },
    {
      'id': '4',
      'title': 'Asymmetrical Layouts',
      'type': 'VIDEO',
      'duration': '18:10',
      'commentCount': 8,
      'isDraft': false,
    },
    {
      'id': '5',
      'title': 'Organic Grid Systems',
      'type': 'PROJECT',
      'duration': '45:00',
      'commentCount': 3,
      'isDraft': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.textPrimary,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.courseDescription,
          style: AppTextTheme.headingMD.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Course Title
            Text(
              widget.courseName,
              style: AppTextTheme.headingLG.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${lessons.length} LESSONS LISTED',
              style: AppTextTheme.bodySmall.copyWith(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),

            // Add Lesson Button
            PrimaryButton(
              label: 'Add Lesson',
              icon: const Icon(Icons.add, size: 20),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.addLesson,
                  arguments: {'courseId': widget.courseId},
                );
              },
            ),
            const SizedBox(height: AppSpacing.lg),

            // Lessons List
            ...lessons.map(
              (lesson) => LessonCard(
                title: lesson['title'],
                type: lesson['type'],
                duration: lesson['duration'],
                commentCount: lesson['commentCount'],
                isDraft: lesson['isDraft'],
                onTap: () {
                  // Handle lesson tap
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Opened: ${lesson['title']}'),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                onCommentTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.studentComments,
                    arguments: {
                      'lessonId': lesson['id'],
                      'lessonTitle': lesson['title'],
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: AppSpacing.lg),

            // Course Insights Section
            Text(
              'Course Insights',
              style: AppTextTheme.headingMD.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                InsightCard(
                  value: '4.2h',
                  label: 'TOTAL LENGTH',
                ),
                const SizedBox(width: AppSpacing.md),
                InsightCard(
                  value: '124',
                  label: 'ACTIVE STUDENTS',
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xl),
          ],
        ),
      ),
    );
  }
}