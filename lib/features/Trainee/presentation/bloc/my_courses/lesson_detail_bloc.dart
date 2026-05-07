import 'package:flutter_bloc/flutter_bloc.dart';
import 'lesson_detail_event.dart';
import 'lesson_detail_state.dart';
import '../../../domain/entities/lesson.dart';

class LessonDetailBloc extends Bloc<LessonDetailEvent, LessonDetailState> {
  LessonDetailBloc() : super(LessonDetailInitial()) {
    on<LoadLessonDetail>(_onLoadLessonDetail);
  }

  Future<void> _onLoadLessonDetail(LoadLessonDetail event, Emitter<LessonDetailState> emit) async {
    emit(LessonDetailLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 600));

      final lesson = Lesson(
        id: "1",
        title: "Introduction to Green Infrastructure",
        moduleName: "MODULE 01 • SUSTAINABILITY",
        videoUrl: "",
        thumbnailUrl: "https://images.unsplash.com/photo-1518173946687-a4c8892bbd9f",
        duration: "45:20",
        currentTime: "12:45",
        description: "In this foundational lesson, we explore the paradigm shift from traditional 'grey' infrastructure to resilient 'green' systems...",
        objectives: [
          "Define the core principles of regenerative design",
          "Analyze case studies of successful biophilic urbanism",
        ],
        resources: ["Worksheet.docx", "Case Study.pdf"],
      );

      emit(LessonDetailLoaded(lesson));
    } catch (e) {
      emit(const LessonDetailError("Failed to load lesson"));
    }
  }
}