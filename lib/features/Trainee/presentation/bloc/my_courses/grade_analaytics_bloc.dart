import 'package:flutter_bloc/flutter_bloc.dart';
import 'grade_analaytics_event.dart';
import 'grade_analaytics_state.dart';

class GradeAnalyticsBloc extends Bloc<GradeAnalyticsEvent, GradeAnalyticsState> {
  GradeAnalyticsBloc() : super(GradeAnalyticsInitial()) {
    on<LoadGradeAnalytics>(_onLoadGradeAnalytics);
  }

  Future<void> _onLoadGradeAnalytics(
    LoadGradeAnalytics event,
    Emitter<GradeAnalyticsState> emit,
  ) async {
    emit(GradeAnalyticsLoading());

    try {
      // 🔹 Simulate API delay
      await Future.delayed(const Duration(seconds: 2));

      // 🔹 Mock structured data (matches your model)
      final data = GradeAnalyticsData(
        gpa: 3.8,
        creditsCompleted: 45,
        overallProgress: 0.72,
        componentBreakdown: {
          "Assignments": 0.12,
          "Quizzes": 0.85,
          "Final Exam": 0.0,
        },
      );

      emit(GradeAnalyticsLoaded(data));
    } catch (e) {
      emit(const GradeAnalyticsError("Failed to load analytics"));
    }
  }
}