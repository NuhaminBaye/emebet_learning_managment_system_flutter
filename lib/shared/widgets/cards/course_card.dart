import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final String title;
  final String instructor;
  final String imageUrl;
  final VoidCallback onTap;

  const CourseCard({
    super.key,
    required this.title,
    required this.instructor,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.network(
                imageUrl,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, maxLines: 2),
                  const SizedBox(height: 6),
                  Text(instructor),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}