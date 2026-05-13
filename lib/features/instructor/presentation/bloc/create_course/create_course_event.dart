import 'package:equatable/equatable.dart';

abstract class CreateCourseEvent extends Equatable {
  const CreateCourseEvent();

  @override
  List<Object?> get props => [];
}

class CreateCourseTitleChanged extends CreateCourseEvent {
  final String title;
  const CreateCourseTitleChanged(this.title);

  @override
  List<Object?> get props => [title];
}

class CreateCourseDescriptionChanged extends CreateCourseEvent {
  final String description;
  const CreateCourseDescriptionChanged(this.description);

  @override
  List<Object?> get props => [description];
}

class CreateCourseDisciplineChanged extends CreateCourseEvent {
  final String? disciplineId;
  const CreateCourseDisciplineChanged(this.disciplineId);

  @override
  List<Object?> get props => [disciplineId];
}

class CreateCourseProficiencyChanged extends CreateCourseEvent {
  final String proficiency;
  const CreateCourseProficiencyChanged(this.proficiency);

  @override
  List<Object?> get props => [proficiency];
}

class CreateCoursePriceChanged extends CreateCourseEvent {
  final String priceUsd;
  const CreateCoursePriceChanged(this.priceUsd);

  @override
  List<Object?> get props => [priceUsd];
}

class CreateCoursePublishRequested extends CreateCourseEvent {
  const CreateCoursePublishRequested();
}

class CreateCourseSaveDraftRequested extends CreateCourseEvent {
  const CreateCourseSaveDraftRequested();
}
