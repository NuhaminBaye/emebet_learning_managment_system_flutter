import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_mobileapp/features/instructor/domain/entities/create_course_draft.dart';
import 'package:lms_mobileapp/features/instructor/presentation/bloc/create_course/create_course_event.dart';
import 'package:lms_mobileapp/features/instructor/presentation/bloc/create_course/create_course_state.dart';

/// Form orchestration for Create Course. Replace [onSubmit] with API calls.
class CreateCourseBloc extends Bloc<CreateCourseEvent, CreateCourseState> {
  CreateCourseBloc({
    Future<void> Function(CreateCourseDraft draft)? onPublish,
    Future<void> Function(CreateCourseDraft draft)? onSaveDraft,
  })  : _onPublish = onPublish,
        _onSaveDraft = onSaveDraft,
        super(const CreateCourseState()) {
    on<CreateCourseTitleChanged>(_onTitle);
    on<CreateCourseDescriptionChanged>(_onDescription);
    on<CreateCourseDisciplineChanged>(_onDiscipline);
    on<CreateCourseProficiencyChanged>(_onProficiency);
    on<CreateCoursePriceChanged>(_onPrice);
    on<CreateCoursePublishRequested>(_onPublishRequested);
    on<CreateCourseSaveDraftRequested>(_onSaveDraftRequested);
  }

  final Future<void> Function(CreateCourseDraft draft)? _onPublish;
  final Future<void> Function(CreateCourseDraft draft)? _onSaveDraft;

  void _onTitle(
    CreateCourseTitleChanged event,
    Emitter<CreateCourseState> emit,
  ) {
    emit(state.copyWith(draft: state.draft.copyWith(title: event.title)));
  }

  void _onDescription(
    CreateCourseDescriptionChanged event,
    Emitter<CreateCourseState> emit,
  ) {
    emit(
      state.copyWith(draft: state.draft.copyWith(description: event.description)),
    );
  }

  void _onDiscipline(
    CreateCourseDisciplineChanged event,
    Emitter<CreateCourseState> emit,
  ) {
    emit(
      state.copyWith(draft: state.draft.copyWith(disciplineId: event.disciplineId)),
    );
  }

  void _onProficiency(
    CreateCourseProficiencyChanged event,
    Emitter<CreateCourseState> emit,
  ) {
    emit(
      state.copyWith(draft: state.draft.copyWith(proficiency: event.proficiency)),
    );
  }

  void _onPrice(
    CreateCoursePriceChanged event,
    Emitter<CreateCourseState> emit,
  ) {
    emit(state.copyWith(draft: state.draft.copyWith(priceUsd: event.priceUsd)));
  }

  Future<void> _onPublishRequested(
    CreateCoursePublishRequested event,
    Emitter<CreateCourseState> emit,
  ) async {
    emit(state.copyWith(status: CreateCourseStatus.submitting, message: null));
    try {
      final publish = _onPublish;
      if (publish != null) {
        await publish(state.draft);
      } else {
        await Future<void>.delayed(const Duration(milliseconds: 400));
      }
      emit(state.copyWith(status: CreateCourseStatus.success));
      emit(state.copyWith(status: CreateCourseStatus.idle));
    } catch (e) {
      emit(
        state.copyWith(
          status: CreateCourseStatus.failure,
          message: e.toString(),
        ),
      );
      emit(state.copyWith(status: CreateCourseStatus.idle, message: null));
    }
  }

  Future<void> _onSaveDraftRequested(
    CreateCourseSaveDraftRequested event,
    Emitter<CreateCourseState> emit,
  ) async {
    emit(state.copyWith(status: CreateCourseStatus.submitting, message: null));
    try {
      final saveDraft = _onSaveDraft;
      if (saveDraft != null) {
        await saveDraft(state.draft);
      } else {
        await Future<void>.delayed(const Duration(milliseconds: 250));
      }
      emit(state.copyWith(status: CreateCourseStatus.success));
      emit(state.copyWith(status: CreateCourseStatus.idle));
    } catch (e) {
      emit(
        state.copyWith(
          status: CreateCourseStatus.failure,
          message: e.toString(),
        ),
      );
      emit(state.copyWith(status: CreateCourseStatus.idle, message: null));
    }
  }
}
