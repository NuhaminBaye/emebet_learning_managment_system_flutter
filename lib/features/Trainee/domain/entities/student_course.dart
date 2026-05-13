import 'package:equatable/equatable.dart';

class StudentCourse extends Equatable {
  final String id;
  final String title;
  final String subtitle;
  final String instructor;
  final String category;
  final String progressLabel;
  final double progress;
  final String price;
  final double rating;
  final int reviewCount;
  final String imageUrl;
  final bool isFree;

  const StudentCourse({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.instructor,
    required this.category,
    required this.progressLabel,
    required this.progress,
    required this.price,
    this.rating = 4.8,
    this.reviewCount = 120,
    required this.imageUrl,
    this.isFree = false,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        subtitle,
        instructor,
        category,
        progressLabel,
        progress,
        price,
        rating,
        reviewCount,
        imageUrl,
        isFree,
      ];
}