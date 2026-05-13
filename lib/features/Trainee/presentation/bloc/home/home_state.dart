import 'package:equatable/equatable.dart';
import '../../../domain/entities/student_course.dart';
import '../../../domain/entities/student_stat.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final String name;
  final double weeklyProgress;
  final StudentCourse currentCourse;
  final List<String> filters;
  final List<StudentCourse> recommendedCourses;
  final List<StudentCourse> trendingCourses;
  final List<StudentStat> stats;

  const HomeLoaded({
    required this.name,
    required this.weeklyProgress,
    required this.currentCourse,
    required this.filters,
    required this.recommendedCourses,
    required this.trendingCourses,
    required this.stats,
  });

  @override
  List<Object?> get props => [
        name,
        weeklyProgress,
        currentCourse,
        filters,
        recommendedCourses,
        trendingCourses,
        stats,
      ];
}

class HomeError extends HomeState {
  final String message;
  const HomeError(this.message);

  @override
  List<Object?> get props => [message];
}