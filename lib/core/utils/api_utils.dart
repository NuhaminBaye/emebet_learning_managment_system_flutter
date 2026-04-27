class ApiUtils {
  static Map<String, String> headers(String? token) {
    return {
      "Content-Type": "application/json",
      if (token != null) "Authorization": "Bearer $token",
    };
  }
}