import 'package:equatable/equatable.dart';
import '../../../domain/entities/lesson.dart';

abstract class LessonDetailState extends Equatable {
  const LessonDetailState();
  @override
  List<Object?> get props => [];
}

class LessonDetailInitial extends LessonDetailState {}
class LessonDetailLoading extends LessonDetailState {}
class LessonDetailLoaded extends LessonDetailState {
  final Lesson lesson;
  const LessonDetailLoaded(this.lesson);
}
class LessonDetailError extends LessonDetailState {
  final String message;
  const LessonDetailError(this.message);
}