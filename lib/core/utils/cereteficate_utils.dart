class CertificateUtils {
  static String generateVerificationCode(String userId, String courseId) {
    return "${userId}_${courseId}_${DateTime.now().millisecondsSinceEpoch}";
  }
}