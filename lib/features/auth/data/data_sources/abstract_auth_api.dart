import 'package:lms_mobileapp/features/auth/data/models/auth_model.dart';
import 'package:lms_mobileapp/features/auth/data/models/user_model.dart';

abstract class AuthApi {
  Future<AuthModel> login({required String email, required String password});
  Future<AuthModel> register({required String name, required String email, required String password});
  Future<void> logout();
  Future<UserModel> getCurrentUser();
  Future<void> forgotPassword({required String email});
}
