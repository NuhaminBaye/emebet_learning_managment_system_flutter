import 'package:equatable/equatable.dart';
import '../../../domain/entities/course.dart';

abstract class CourseDetailState extends Equatable {
  const CourseDetailState();
  @override
  List<Object?> get props => [];
}

class CourseDetailInitial extends CourseDetailState {}

class CourseDetailLoading extends CourseDetailState {}

class CourseDetailLoaded extends CourseDetailState {
  final Course course;
  const CourseDetailLoaded(this.course);
}

class CourseDetailError extends CourseDetailState {
  final String message;
  const CourseDetailError(this.message);
}