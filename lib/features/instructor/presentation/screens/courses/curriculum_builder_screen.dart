import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/constants/app_routes.dart';
import 'package:lms_mobileapp/core/theme/instructor_design.dart';
import 'package:lms_mobileapp/features/instructor/presentation/widgets/insight_card.dart';
import 'package:lms_mobileapp/features/instructor/presentation/widgets/lesson_card.dart';

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
      backgroundColor: InstructorDesign.canvas,
      appBar: AppBar(
        backgroundColor: InstructorDesign.canvas,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
          color: InstructorDesign.textPrimary,
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Curriculum Builder',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w800,
            color: InstructorDesign.textPrimary,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
        children: [
          Text(
            widget.courseName,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: InstructorDesign.textPrimary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '${lessons.length} LESSONS LISTED',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.9,
              color: InstructorDesign.textTertiary,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.addLesson,
                  arguments: {'courseId': widget.courseId},
                );
              },
              icon: const Icon(Icons.add_rounded, size: 22),
              label: const Text(
                'ADD LESSON',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.6,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: InstructorDesign.primary,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ...lessons.asMap().entries.map((entry) {
            final index = entry.key;
            final lesson = entry.value;
            final moduleNum = (index + 1).toString().padLeft(2, '0');
            return LessonCard(
              moduleLabel: 'Module $moduleNum',
              title: lesson['title'] as String,
              type: lesson['type'] as String,
              duration: lesson['duration'] as String,
              commentCount: lesson['commentCount'] as int,
              isDraft: lesson['isDraft'] as bool,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Opened: ${lesson['title']}')),
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
            );
          }),
          const SizedBox(height: 28),
          const Text(
            'Course Insights',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: InstructorDesign.textPrimary,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: const [
              InsightCard(
                value: '4.2h',
                label: 'TOTAL LENGTH',
              ),
              SizedBox(width: 12),
              InsightCard(
                value: '124',
                label: 'ACTIVE STUDENTS',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
