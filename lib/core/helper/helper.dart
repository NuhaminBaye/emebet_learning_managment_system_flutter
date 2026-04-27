import 'package:flutter/material.dart';

class Helper {
  /// Get Dio Header
  static Map<String, dynamic> getHeaders() {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    }..removeWhere((key, value) => value == null);
  }
}
