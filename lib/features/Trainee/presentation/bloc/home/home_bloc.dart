import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';
import '../../../domain/entities/student_course.dart';
import '../../../domain/entities/student_stat.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<LoadHomeContent>(_onLoadHomeContent);
  }

  Future<void> _onLoadHomeContent(LoadHomeContent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 700));

      emit(HomeLoaded(
        name: 'Alex',
        weeklyProgress: 0.75,
        currentCourse: const StudentCourse(
          title: 'Advanced Architectural Visualization',
          subtitle: 'Section 4: Lighting & Materials',
          category: 'Design',
          progressLabel: '75% complete',
          progress: 0.75,
          price: '\$24.00',
          imageUrl: 'https://images.unsplash.com/photo-1557804506-669a67965ba0?auto=format&fit=crop&w=800&q=80',
        ),
        filters: const ['All Topics', 'Design', 'Coding'],
        recommendedCourses: [
          const StudentCourse(
            title: 'Mastering Minimalist UI Principles',
            subtitle: 'UI Design',
            category: 'Design',
            progressLabel: 'Free',
            progress: 0,
            price: 'Free',
            imageUrl: 'https://images.unsplash.com/photo-1498050108023-c5249f4df085?auto=format&fit=crop&w=800&q=80',
            isFree: true,
          ),
          const StudentCourse(
            title: 'Building Scalable Systems',
            subtitle: 'System Design',
            category: 'Development',
            progressLabel: '\$32.00',
            progress: 0,
            price: '\$24.00',
            imageUrl: 'https://images.unsplash.com/photo-1518770660439-4636190af475?auto=format&fit=crop&w=800&q=80',
          ),
        ],
        trendingCourses: [
          // Add more as needed
        ],
        stats: const [
          StudentStat(label: 'Courses Completed', value: '12', icon: Icons.check_circle_outline, background: Color(0xFFE1FCEF)),
          StudentStat(label: 'Learning Time', value: '48h', icon: Icons.access_time, background: Color(0xFFEFF6FF)),
          StudentStat(label: 'Achievements', value: '15', icon: Icons.emoji_events, background: Color(0xFFFFF7E5)),
        ],
      ));
    } catch (e) {
      emit(const HomeError("Failed to load home content"));
    }
  }
}