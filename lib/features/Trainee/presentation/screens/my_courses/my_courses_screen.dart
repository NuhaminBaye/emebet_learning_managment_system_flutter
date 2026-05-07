// import 'package:flutter/material.dart';

// class MyCoursesScreen extends StatelessWidget {
//   const MyCoursesScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:lms_mobileapp/features/Trainee/presentation/screens/my_courses/lesson_detail_screen.dart';

// class MyCoursesScreen extends StatelessWidget {
//   const MyCoursesScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const LessonDetailScreen();
//   }
// }

import 'package:flutter/material.dart';
import 'package:lms_mobileapp/features/Trainee/presentation/screens/my_courses/lesson_detail_screen.dart';

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Directly navigate to Lesson Detail Screen
    return const LessonDetailScreen();
  }
}