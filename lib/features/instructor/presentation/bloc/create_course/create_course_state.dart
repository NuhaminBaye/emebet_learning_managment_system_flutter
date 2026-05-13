import 'package:equatable/equatable.dart';
import 'package:lms_mobileapp/features/instructor/domain/entities/create_course_draft.dart';

enum CreateCourseStatus { idle, submitting, success, failure }

class CreateCourseState extends Equatable {
  final CreateCourseDraft draft;
  final CreateCourseStatus status;
  final String? message;

  const CreateCourseState({
    this.draft = const CreateCourseDraft(),
    this.status = CreateCourseStatus.idle,
    this.message,
  });

  CreateCourseState copyWith({
    CreateCourseDraft? draft,
    CreateCourseStatus? status,
    String? message,
  }) {
    return CreateCourseState(
      draft: draft ?? this.draft,
      status: status ?? this.status,
      message: message,
    );
  }

  @override
  List<Object?> get props => [draft, status, message];
}
