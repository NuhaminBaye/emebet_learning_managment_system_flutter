import 'package:equatable/equatable.dart';

class Course extends Equatable {
  final String id;
  final String title;
  final String instructor;
  final String imageUrl;
  final String price;
  final String rating;
  final String reviewCount;
  final String description;
  final List<String> learningPoints;
  final List<CourseModule> modules;

  const Course({
    required this.id,
    required this.title,
    required this.instructor,
    required this.imageUrl,
    required this.price,
    required this.rating,
    required this.reviewCount,
    required this.description,
    required this.learningPoints,
    required this.modules,
  });

  @override
  List<Object?> get props => [id, title, instructor, imageUrl, price, rating, reviewCount];
}

class CourseModule extends Equatable {
  final String title;
  final String duration;
  final int lessonCount;
  final bool isLocked;

  const CourseModule({
    required this.title,
    required this.duration,
    required this.lessonCount,
    this.isLocked = false,
  });

  @override
  List<Object?> get props => [title, duration, lessonCount, isLocked];
}