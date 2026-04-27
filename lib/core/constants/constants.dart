import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lms_mobileapp/core/network/error/failures.dart';

late BuildContext globalContext;

class Constants {
  static String get baseUrl => dotenv.get('BASE_URL');

  static String get emailRegEx =>
      r"^([a-zA-Z0-9_.+-]+)@([a-zA-Z0-9-]+)\.([a-zA-Z]{2,25})$";

  static String get googleApiKey {
    if (kIsWeb) {
      return dotenv.get('GOOGLE_API_KEY_WEB');
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return dotenv.get('GOOGLE_API_KEY_IOS');
    } else {
      return dotenv.get('GOOGLE_API_KEY_ANDROID');
    }
  }
}

typedef ResultFuture<T> = Future<Either<Failure, T>>;
