import 'package:lms_mobileapp/features/auth/data/models/user_model.dart';

class AuthModel {
  final String accessToken;
  final String refreshToken;
  final UserModel user;

  const AuthModel({
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    final payload = json['data'] as Map<String, dynamic>? ?? json;
    final accessToken = payload['accessToken'] as String? ?? payload['access_token'] as String? ?? '';
    final refreshToken = payload['refreshToken'] as String? ?? payload['refresh_token'] as String? ?? '';
    final userJson = payload['user'] as Map<String, dynamic>? ?? payload['profile'] as Map<String, dynamic>? ?? payload;

    return AuthModel(
      accessToken: accessToken,
      refreshToken: refreshToken,
      user: UserModel.fromJson(userJson),
    );
  }
}
