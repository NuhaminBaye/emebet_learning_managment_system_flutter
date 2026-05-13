import 'package:flutter/material.dart';

class AppShadows {
  static const card = BoxShadow(
    color: Color(0x12000000),
    blurRadius: 16,
    offset: Offset(0, 8),
  );

  static const topBar = BoxShadow(
    color: Color(0x11000000),
    blurRadius: 12,
    offset: Offset(0, -3),
  );
}
