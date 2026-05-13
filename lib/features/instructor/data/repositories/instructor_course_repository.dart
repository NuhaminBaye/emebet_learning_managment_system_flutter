import 'package:lms_mobileapp/features/instructor/data/dtos/instructor_course_dto.dart';

abstract class InstructorCourseRepository {
  Future<InstructorCoursePage> listCourses({
    required int page,
    required int pageSize,
    bool? draftsOnly,
  });
}
