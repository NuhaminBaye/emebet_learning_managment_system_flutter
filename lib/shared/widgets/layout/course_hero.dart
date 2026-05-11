import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';
import 'package:lms_mobileapp/features/Trainee/domain/entities/course.dart';

class CourseHero extends StatelessWidget {
  final Course course;

  const CourseHero({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 280,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(course.imageUrl, fit: BoxFit.cover),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black54],
                ),
              ),
            ),
            const Center(
              child: CircleAvatar(
                radius: 36,
                backgroundColor: Colors.white,
                child: Icon(Icons.play_arrow, size: 50, color: Color(0xFF22C55E)),
              ),
            ),
          ],
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(icon: const Icon(Icons.favorite_border, color: Colors.white), onPressed: () {}),
        IconButton(icon: const Icon(Icons.share, color: Colors.white), onPressed: () {}),
      ],
    );
  }
}