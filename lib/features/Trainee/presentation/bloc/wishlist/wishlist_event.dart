import 'package:equatable/equatable.dart';
import 'package:lms_mobileapp/features/Trainee/domain/entities/student_course.dart';

abstract class WishlistEvent extends Equatable {
  const WishlistEvent();

  @override
  List<Object?> get props => [];
}

class WishlistStarted extends WishlistEvent {
  const WishlistStarted();
}

class WishlistToggled extends WishlistEvent {
  const WishlistToggled(this.course);

  final StudentCourse course;

  @override
  List<Object?> get props => [course];
}

class WishlistCleared extends WishlistEvent {
  const WishlistCleared();
}
