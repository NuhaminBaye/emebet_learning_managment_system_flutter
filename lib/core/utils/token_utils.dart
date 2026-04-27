import 'dart:convert';

class TokenUtils {
  static Map<String, dynamic> decodeJWT(String token) {
    final parts = token.split('.');
    final payload = parts[1];
    return jsonDecode(utf8.decode(base64Url.decode(base64Url.normalize(payload))));
  }

  static bool isExpired(String token) {
    final payload = decodeJWT(token);
    final exp = payload['exp'];
    return DateTime.now().millisecondsSinceEpoch > exp * 1000;
  }
}