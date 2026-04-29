import 'package:lms_mobileapp/core/constants/constants.dart';
import '../models/user_model.dart';

abstract class AuthRepository {
  ResultFuture<UserModel> login(String email, String password);
  ResultFuture<UserModel> register(String name, String email, String password);
  ResultFuture<void> logout();
  ResultFuture<UserModel> getCurrentUser();
  ResultFuture<void> forgotPassword(String email);
}
