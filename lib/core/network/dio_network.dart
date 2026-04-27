import 'package:dio/dio.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:lms_mobileapp/core/constants/api_endpoints.dart';
import 'package:lms_mobileapp/core/constants/app_routes.dart';
import 'package:lms_mobileapp/core/constants/constants.dart';
import 'package:lms_mobileapp/core/log/app_logger.dart';
import 'package:lms_mobileapp/core/network/logger_interceptor.dart';

import '../helper/helper.dart';

class DioNetwork {
  static late Dio appAPI;
  static late Dio retryAPI;
  static const FlutterSecureStorage secureStorage = FlutterSecureStorage();

  static Future<void> initDio(int timeout) async {
    appAPI = Dio(baseOptions(Constants.baseUrl, timeout));
    appAPI.interceptors.add(loggerInterceptor());
    appAPI.interceptors.add(appQueuedInterceptorsWrapper());

    retryAPI = Dio(baseOptions(Constants.baseUrl, timeout));
    retryAPI.interceptors.add(loggerInterceptor());
    retryAPI.interceptors.add(interceptorsWrapper());
  }

  static LoggerInterceptor loggerInterceptor() {
    return LoggerInterceptor(
      logger,
      request: true,
      requestBody: true,
      error: true,
      responseBody: true,
      responseHeader: true,
      requestHeader: true,
    );
  }

  /// 🔥 MAIN INTERCEPTOR
  static QueuedInterceptorsWrapper appQueuedInterceptorsWrapper() {
    return QueuedInterceptorsWrapper(
      onRequest: (options, handler) async {
        final accessToken =
            await secureStorage.read(key: 'accessToken');

        final headers = Helper.getHeaders();

        if (accessToken != null) {
          headers["Authorization"] = "Bearer $accessToken";
        }

        options.headers = headers;
        return handler.next(options);
      },

      onError: (error, handler) async {
        final statusCode = error.response?.statusCode;

        /// 🔴 TOKEN EXPIRED
        if (statusCode == 401) {
          final refreshed = await _refreshToken();

          if (refreshed) {
            final requestOptions = error.requestOptions;

            final newHeaders = Helper.getHeaders();
            final newAccessToken =
                await secureStorage.read(key: 'accessToken');

            if (newAccessToken != null) {
              newHeaders["Authorization"] =
                  "Bearer $newAccessToken";
            }

            requestOptions.headers = newHeaders;

            final response = await appAPI.fetch(requestOptions);
            return handler.resolve(response);
          } else {
            await _forceLogout();
          }
        }

        /// 🔴 FORCED LOGOUT FROM SERVER
        else if (statusCode == 403 &&
            error.response?.data['data']?['logout'] == true) {
          await _forceLogout();
        }

        return handler.next(error);
      },
    );
  }

  /// 🔁 RETRY INTERCEPTOR
  static InterceptorsWrapper interceptorsWrapper() {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        final headers = Helper.getHeaders();

        final refreshToken =
            await secureStorage.read(key: 'refreshToken');

        if (refreshToken != null) {
          headers["x-refresh-token"] = refreshToken;
        }

        options.headers = headers;
        return handler.next(options);
      },
    );
  }

  static BaseOptions baseOptions(String url, int timeout) {
    final headers = Helper.getHeaders();

    return BaseOptions(
      baseUrl: url,
      connectTimeout: Duration(seconds: timeout),
      receiveTimeout: Duration(seconds: timeout),
      sendTimeout: Duration(seconds: timeout),
      validateStatus: (s) => s! < 300,
      headers: headers..removeWhere((k, v) => v == null),
      responseType: ResponseType.json,
    );
  }

  /// 🔥 REFRESH TOKEN
  static Future<bool> _refreshToken() async {
    try {
      final refreshToken =
          await secureStorage.read(key: 'refreshToken');

      if (refreshToken == null) return false;

      final response = await retryAPI.post(
        ApiEndpoints.refreshToken,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        await secureStorage.write(
          key: "accessToken",
          value: response.data['accessToken'],
        );

        return true;
      }

      return false;
    } catch (_) {
      return false;
    }
  }

  /// 🔴 CLEAN LOGOUT (VERY IMPORTANT)
  static Future<void> _forceLogout() async {
    final box = await Hive.openBox('user');
    await box.clear();

    await secureStorage.deleteAll();

    Navigator.of(globalContext).pushNamedAndRemoveUntil(
      AppRoutes.login,
      (_) => false,
    );
  }
}