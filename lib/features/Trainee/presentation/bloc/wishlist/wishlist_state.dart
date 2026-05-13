import 'package:equatable/equatable.dart';
import 'package:lms_mobileapp/features/Trainee/domain/entities/student_course.dart';

class WishlistState extends Equatable {
  const WishlistState({
    this.courses = const [],
    this.isLoading = false,
  });

  final List<StudentCourse> courses;
  final bool isLoading;

  bool contains(String courseId) => courses.any((course) => course.id == courseId);

  WishlistState copyWith({
    List<StudentCourse>? courses,
    bool? isLoading,
  }) {
    return WishlistState(
      courses: courses ?? this.courses,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [courses, isLoading];
}
