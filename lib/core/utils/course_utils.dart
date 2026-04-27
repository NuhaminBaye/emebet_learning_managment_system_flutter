class CourseUtils {
  static bool isPublished(String status) => status == "published";

  static String formatCourseDuration(int minutes) {
    final hours = minutes ~/ 60;
    final mins = minutes % 60;
    return "$hours hr $mins min";
  }
}