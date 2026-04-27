import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  static Future<void> load({String env = 'dev'}) async {
    await dotenv.load(fileName: '.env.$env');
  }

  static String get baseUrl => dotenv.get('BASE_URL');
  static String get googleApiKeyIOS => dotenv.get('GOOGLE_API_KEY_IOS');
  static String get googleApiKeyAndroid => dotenv.get('GOOGLE_API_KEY_ANDROID');
  static String get directionsApiUrl => dotenv.get('DIRECTIONS_API_URL');
}
