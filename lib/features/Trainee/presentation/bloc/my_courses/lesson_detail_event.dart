import 'package:equatable/equatable.dart';

abstract class LessonDetailEvent extends Equatable {
  const LessonDetailEvent();
  @override
  List<Object?> get props => [];
}

class LoadLessonDetail extends LessonDetailEvent {}