import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:lms_mobileapp/core/constants/api_endpoints.dart';
import 'package:lms_mobileapp/core/network/dio_network.dart';
import 'package:lms_mobileapp/features/auth/data/data_sources/abstract_auth_api.dart';
import 'package:lms_mobileapp/features/auth/data/models/auth_model.dart';
import 'package:lms_mobileapp/features/auth/data/models/user_model.dart';

class AuthApiImpl implements AuthApi {
  final Dio _client = DioNetwork.appAPI;

  /// 🔐 LOGIN
  @override
  Future<AuthModel> login({
    required String email,
    required String password,
  }) async {
    final response = await _client.post(
      ApiEndpoints.login,
      data: {
        'email': email,
        'password': password,
      },
    );

    final Map<String, dynamic> raw =
        response.data as Map<String, dynamic>;

    /// 🔥 Handle nested or direct response
    final data = raw['data'] ?? raw;

    /// 🔐 Save tokens
    await DioNetwork.secureStorage.write(
      key: 'accessToken',
      value: data['accessToken'],
    );

    await DioNetwork.secureStorage.write(
      key: 'refreshToken',
      value: data['refreshToken'],
    );

    /// 👤 Save user locally (Hive)
    if (data['user'] != null) {
      final box = await Hive.openBox('user');
      await box.put(
        'userData',
        UserModel.fromJson(data['user']),
      );
    }

    return AuthModel.fromJson(data);
  }

  /// 📝 REGISTER
  @override
  Future<AuthModel> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await _client.post(
      ApiEndpoints.register,
      data: {
        'name': name,
        'email': email,
        'password': password,
      },
    );

    final Map<String, dynamic> raw =
        response.data as Map<String, dynamic>;

    final data = raw['data'] ?? raw;

    return AuthModel.fromJson(data);
  }

  /// 🚪 LOGOUT
  @override
  Future<void> logout() async {
    try {
      await _client.post(ApiEndpoints.logout);
    } catch (_) {
      // Ignore API failure, still logout locally
    } finally {
      /// 🔥 Clear secure storage
      await DioNetwork.secureStorage.deleteAll();

      /// 🔥 Clear local DB
      final box = await Hive.openBox('user');
      await box.clear();
    }
  }

  /// 👤 GET CURRENT USER
  @override
  Future<UserModel> getCurrentUser() async {
    final response =
        await _client.get(ApiEndpoints.getMyProfile);

    final Map<String, dynamic> raw =
        response.data as Map<String, dynamic>;

    final data = raw['data'] ?? raw;

    final user = UserModel.fromJson(data);

    /// 🔥 Cache user locally
    final box = await Hive.openBox('user');
    await box.put('userData', user);

    return user;
  }

  /// 🔁 FORGOT PASSWORD
  @override
  Future<void> forgotPassword({
    required String email,
  }) async {
    await _client.post(
      ApiEndpoints.resetPassword,
      data: {'email': email},
    );
  }
}