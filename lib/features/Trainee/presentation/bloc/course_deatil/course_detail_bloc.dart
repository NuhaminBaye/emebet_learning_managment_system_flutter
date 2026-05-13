import 'package:flutter_bloc/flutter_bloc.dart';
import 'course_detail_event.dart';
import 'course_detail_state.dart';
import '../../../domain/entities/course.dart';

class CourseDetailBloc extends Bloc<CourseDetailEvent, CourseDetailState> {
  CourseDetailBloc() : super(CourseDetailInitial()) {
    on<LoadCourseDetail>(_onLoadCourseDetail);
  }

  Future<void> _onLoadCourseDetail(LoadCourseDetail event, Emitter<CourseDetailState> emit) async {
    emit(CourseDetailLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 800));

      final course = Course(
        id: "1",
        title: "Sustainable Urban Planning",
        instructor: "Sarah Williams",
        imageUrl: "https://picsum.photos/seed/sustainable-city/1000/650",
        price: "\$45.00",
        rating: "4.8",
        reviewCount: "2,345",
        description: "This masterclass provides a comprehensive framework for designing cities that thrive in harmony with nature...",
        learningPoints: [
          "Core concepts of sustainable design in urban planning",
          "How to create livable, equitable, and sustainable developments",
          "Real-world case studies from Copenhagen to Singapore",
          "Community resilience and restoration practices",
        ],
        modules: [
          CourseModule(title: "Module 1: The Green Foundation", duration: "2h 15m", lessonCount: 8),
          CourseModule(title: "Module 2: Climate & Cities", duration: "3h 40m", lessonCount: 12),
          CourseModule(title: "Module 3: Urban Regeneration", duration: "2h 50m", lessonCount: 9, isLocked: true),
        ],
      );

      emit(CourseDetailLoaded(course));
    } catch (e) {
      emit(const CourseDetailError("Failed to load course details"));
    }
  }
}