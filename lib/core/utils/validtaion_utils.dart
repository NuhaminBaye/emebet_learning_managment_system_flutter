class ValidationUtils {
  static final RegExp _emailRegex = RegExp(
    r'^[\w\.-]+@[\w\.-]+\.\w+$',
  );

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Email is required";
    }
    if (!_emailRegex.hasMatch(value)) {
      return "Invalid email address";
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    if (value.length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  }

  static String? required(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "This field is required";
    }
    return null;
  }
}