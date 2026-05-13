import 'package:equatable/equatable.dart';

/// Backend-ready course row for instructor course management.
class InstructorCourseDto extends Equatable {
  final String id;
  final String title;
  final String category;
  final String coverImageUrl;
  final int studentCount;
  final double rating;
  final bool isDraft;

  const InstructorCourseDto({
    required this.id,
    required this.title,
    required this.category,
    required this.coverImageUrl,
    required this.studentCount,
    required this.rating,
    required this.isDraft,
  });

  @override
  List<Object?> get props =>
      [id, title, category, coverImageUrl, studentCount, rating, isDraft];
}

/// Pagination envelope for list endpoints.
class InstructorCoursePage extends Equatable {
  final List<InstructorCourseDto> items;
  final int page;
  final int pageSize;
  final int totalCount;

  const InstructorCoursePage({
    required this.items,
    required this.page,
    required this.pageSize,
    required this.totalCount,
  });

  bool get hasMore => (page + 1) * pageSize < totalCount;

  @override
  List<Object?> get props => [items, page, pageSize, totalCount];
}
