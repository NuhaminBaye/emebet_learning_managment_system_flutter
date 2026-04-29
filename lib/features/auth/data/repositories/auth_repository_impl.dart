import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lms_mobileapp/core/constants/constants.dart';
import 'package:lms_mobileapp/core/network/error/dio_error_handler.dart';
import 'package:lms_mobileapp/core/network/error/failures.dart';
import 'package:lms_mobileapp/features/auth/data/data_sources/abstract_auth_api.dart';
import 'package:lms_mobileapp/features/auth/data/data_sources/auth_impl_api.dart';
import 'package:lms_mobileapp/features/auth/domain/models/auth_model.dart';
import 'package:lms_mobileapp/features/auth/domain/models/user_model.dart';
import 'package:lms_mobileapp/features/auth/domain/repositories/abstract_auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApi _authApi;
  final FlutterSecureStorage _secureStorage;

  AuthRepositoryImpl({AuthApi? authApi, FlutterSecureStorage? secureStorage})
      : _authApi = authApi ?? AuthApiImpl(),
        _secureStorage = secureStorage ?? const FlutterSecureStorage();

  @override
  ResultFuture<UserModel> login(String email, String password) async {
    try {
      final auth = await _authApi.login(email: email, password: password);
      await _persistAuth(auth);
      return right(auth.user);
    } on DioException catch (error) {
      return left(ServerFailure(handleDioError(error), error.response?.statusCode));
    } catch (error) {
      return left(ServerFailure('Unable to login. Please try again.', null));
    }
  }

  @override
  ResultFuture<UserModel> register(String name, String email, String password) async {
    try {
      final auth = await _authApi.register(name: name, email: email, password: password);
      await _persistAuth(auth);
      return right(auth.user);
    } on DioException catch (error) {
      return left(ServerFailure(handleDioError(error), error.response?.statusCode));
    } catch (error) {
      return left(ServerFailure('Unable to create account. Please try again.', null));
    }
  }

  @override
  ResultFuture<void> logout() async {
    try {
      await _authApi.logout();
      await _clearAuth();
      return right(null);
    } on DioException catch (error) {
      return left(ServerFailure(handleDioError(error), error.response?.statusCode));
    } catch (error) {
      return left(ServerFailure('Unable to sign out. Please try again.', null));
    }
  }

  @override
  ResultFuture<UserModel> getCurrentUser() async {
    try {
      final user = await _authApi.getCurrentUser();
      return right(user);
    } on DioException catch (error) {
      return left(ServerFailure(handleDioError(error), error.response?.statusCode));
    } catch (error) {
      return left(ServerFailure('Unable to fetch profile. Please try again.', null));
    }
  }

  @override
  ResultFuture<void> forgotPassword(String email) async {
    try {
      await _authApi.forgotPassword(email: email);
      return right(null);
    } on DioException catch (error) {
      return left(ServerFailure(handleDioError(error), error.response?.statusCode));
    } catch (error) {
      return left(ServerFailure('Unable to process password reset. Please try again.', null));
    }
  }

  Future<void> _persistAuth(AuthModel auth) async {
    await _secureStorage.write(key: 'accessToken', value: auth.accessToken);
    await _secureStorage.write(key: 'refreshToken', value: auth.refreshToken);
  }

  Future<void> _clearAuth() async {
    await _secureStorage.delete(key: 'accessToken');
    await _secureStorage.delete(key: 'refreshToken');
  }
}
