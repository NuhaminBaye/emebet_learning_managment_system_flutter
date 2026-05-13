import 'package:lms_mobileapp/features/instructor/data/dtos/instructor_course_dto.dart';
import 'package:lms_mobileapp/features/instructor/data/repositories/instructor_course_repository.dart';

class MockInstructorCourseRepository implements InstructorCourseRepository {
  static const _seed = <InstructorCourseDto>[
    InstructorCourseDto(
      id: '1',
      title: 'The Geometry of Light',
      category: 'Architecture',
      coverImageUrl: 'https://picsum.photos/seed/geom/800/520',
      studentCount: 842,
      rating: 4.9,
      isDraft: false,
    ),
    InstructorCourseDto(
      id: '2',
      title: 'Sustainable Design Principles 101',
      category: 'Design',
      coverImageUrl: 'https://picsum.photos/seed/sust/800/520',
      studentCount: 0,
      rating: 0,
      isDraft: true,
    ),
    InstructorCourseDto(
      id: '3',
      title: 'Typography Masterclass',
      category: 'Visual Arts',
      coverImageUrl: 'https://picsum.photos/seed/type/800/520',
      studentCount: 1204,
      rating: 4.8,
      isDraft: false,
    ),
  ];

  @override
  Future<InstructorCoursePage> listCourses({
    required int page,
    required int pageSize,
    bool? draftsOnly,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 180));
    var list = List<InstructorCourseDto>.from(_seed);
    if (draftsOnly != null) {
      list = list.where((c) => c.isDraft == draftsOnly).toList();
    }
    final start = page * pageSize;
    final slice = start >= list.length
        ? <InstructorCourseDto>[]
        : list.skip(start).take(pageSize).toList();
    return InstructorCoursePage(
      items: slice,
      page: page,
      pageSize: pageSize,
      totalCount: list.length,
    );
  }
}
