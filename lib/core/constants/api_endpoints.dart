class ApiEndpoints {
  // =========================
  // AUTH / IDENTITY SERVICE
  // =========================
  static const String register = '/auth/register';
  static const String login = '/auth/login';
  static const String logout = '/auth/logout';
  static const String refreshToken = '/auth/refresh';
  static const String requestOtp = '/auth/request-otp';
  static const String verifyOtp = '/auth/verify-otp';
  static const String resetPassword = '/auth/reset-password';
  static const String verifyEmail = '/auth/verify-email';

  // Roles
  static const String getRoles = '/roles';
  static const String createRole = '/roles';
  static String updateRole(String id) => '/roles/$id';
  static String deleteRole(String id) => '/roles/$id';

  // User Roles
  static String assignRoleToUser(String userId) => '/users/$userId/roles';

  // =========================
  // USER PROFILE SERVICE
  // =========================
  static const String getMyProfile = '/profiles/me';
  static const String updateMyProfile = '/profiles/me';
  static const String uploadAvatar = '/profiles/me/avatar';

  // =========================
  // CATALOG SERVICE
  // =========================
  static const String getCategories = '/categories';
  static const String createCategory = '/categories';
  static String updateCategory(String id) => '/categories/$id';
  static String deleteCategory(String id) => '/categories/$id';

  static const String getCoursesCatalog = '/catalog/courses';
  static String getCourseById(String id) => '/catalog/courses/$id';

  // =========================
  // COURSE CONTENT SERVICE
  // =========================
  static const String createCourse = '/courses';
  static String getCourse(String id) => '/courses/$id';
  static String updateCourse(String id) => '/courses/$id';
  static String deleteCourse(String id) => '/courses/$id';

  static String publishCourse(String id) => '/courses/$id/publish';
  static String addLesson(String courseId) => '/courses/$courseId/lessons';
  static String updateLesson(String lessonId) => '/lessons/$lessonId';

  // =========================
  // ENROLLMENT & LEARNING
  // =========================
  static const String enroll = '/enrollments';
  static const String getMyEnrollments = '/enrollments/me';

  static String completeLesson(String lessonId) =>
      '/learning/lessons/$lessonId/complete';

  static String getCourseProgress(String courseId) =>
      '/learning/courses/$courseId/progress';

  // =========================
  // ASSESSMENT SERVICE
  // =========================
  static String submitAssignment(String assignmentId) =>
      '/assignments/$assignmentId/submissions';

  static String startQuizAttempt(String quizId) =>
      '/quizzes/$quizId/attempts/start';

  static String submitQuizAttempt(String quizId, String attemptId) =>
      '/quizzes/$quizId/attempts/$attemptId/submit';

  // =========================
  // GRADING SERVICE
  // =========================
  static String gradeSubmission(String submissionId) =>
      '/grading/submissions/$submissionId';

  static String getGradebook(String courseId) =>
      '/grading/courses/$courseId/gradebook';

  // =========================
  // CERTIFICATE SERVICE
  // =========================
  static const String generateCertificate = '/certificates/generate';
  static const String getMyCertificates = '/certificates/me';
  static String verifyCertificate(String code) =>
      '/certificates/verify/$code';

  // =========================
  // ENGAGEMENT SERVICE
  // =========================
  static const String postComment = '/comments';
  static const String postReview = '/reviews';
  static String addToWishlist(String courseId) =>
      '/wishlist/$courseId';

  // =========================
  // NOTIFICATION SERVICE
  // =========================
  static const String getMyNotifications = '/notifications/me';
  static String markNotificationRead(String id) =>
      '/notifications/$id/read';

  // =========================
  // COMMERCE SERVICE
  // =========================
  static const String checkoutPayment = '/payments/checkout';
  static const String paymentWebhook = '/payments/webhooks';
  static const String getMyInvoices = '/invoices/me';

  // =========================
  // ANALYTICS SERVICE
  // =========================
  static const String exportReports = '/reports/export';

  // =========================
  // MEDIA SERVICE
  // =========================
  static const String uploadFile = '/files/upload';
  static String getFile(String id) => '/files/$id';

  // =========================
  // AUDIT SERVICE
  // =========================
  static const String getAuditLogs = '/audit/logs';
  static const String exportCompliance = '/compliance/export';
}