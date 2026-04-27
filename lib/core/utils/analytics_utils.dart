class AnalyticsUtils {
  static double calculateGrowth(double current, double previous) {
    if (previous == 0) return 0;
    return ((current - previous) / previous) * 100;
  }
}