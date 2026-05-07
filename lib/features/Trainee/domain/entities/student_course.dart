import 'package:equatable/equatable.dart';

class StudentCourse extends Equatable {
  final String title;
  final String subtitle;
  final String category;
  final String progressLabel;
  final double progress;
  final String price;
  final String imageUrl;
  final bool isFree;

  const StudentCourse({
    required this.title,
    required this.subtitle,
    required this.category,
    required this.progressLabel,
    required this.progress,
    required this.price,
    required this.imageUrl,
    this.isFree = false,
  });

  @override
  List<Object?> get props => [title, subtitle, category, progressLabel, progress, price, imageUrl, isFree];
}