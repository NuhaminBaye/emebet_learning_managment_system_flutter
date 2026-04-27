class LearningUtils {
  static double calculateProgress(int completed, int total) {
    if (total == 0) return 0;
    return (completed / total) * 100;
  }
}