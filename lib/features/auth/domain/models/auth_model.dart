import 'package:hive/hive.dart';
import 'user_model.dart';

part 'auth_model.g.dart';

@HiveType(typeId: 10)
class AuthModel extends HiveObject {
  @HiveField(0)
  final String accessToken;

  @HiveField(1)
  final String refreshToken;

  @HiveField(2)
  final UserModel user;

  @HiveField(3)
  final DateTime? expiresAt;

  AuthModel({
    required this.accessToken,
    required this.refreshToken,
    required this.user,
    this.expiresAt,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    final payload = json['data'] as Map<String, dynamic>? ?? json;

    return AuthModel(
      accessToken: payload['accessToken'] ??
          payload['access_token'] ??
          '',
      refreshToken: payload['refreshToken'] ??
          payload['refresh_token'] ??
          '',
      expiresAt: payload['expiresAt'] != null
          ? DateTime.tryParse(payload['expiresAt'])
          : null,
      user: UserModel.fromJson(
        payload['user'] ??
            payload['profile'] ??
            payload,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'expiresAt': expiresAt?.toIso8601String(),
      'user': user.toJson(),
    };
  }

  AuthModel copyWith({
    String? accessToken,
    String? refreshToken,
    UserModel? user,
    DateTime? expiresAt,
  }) {
    return AuthModel(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      user: user ?? this.user,
      expiresAt: expiresAt ?? this.expiresAt,
    );
  }
}