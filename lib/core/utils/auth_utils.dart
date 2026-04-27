class AuthUtils {
  static bool isLoggedIn(String? token) => token != null && token.isNotEmpty;

  static bool isOtpValid(DateTime expiry) {
    return DateTime.now().isBefore(expiry);
  }
}