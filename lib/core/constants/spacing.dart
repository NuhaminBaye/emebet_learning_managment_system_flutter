import 'package:flutter/material.dart';

class AppSpacing {
  // Spacing Scale
  static const double zero = 0;
  static const double xxs = 2;
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;
  static const double xxxl = 64;

  // Spacing Tokens
  static const EdgeInsets sectionPadding = EdgeInsets.symmetric(
    vertical: lg,
    horizontal: md,
  );

  static const EdgeInsets cardPadding = EdgeInsets.all(md);
  
  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(
    vertical: sm,
    horizontal: md,
  );

  static const EdgeInsets inputPadding = EdgeInsets.all(md);
  
  static const SizedBox verticalXs = SizedBox(height: xs);
  static const SizedBox verticalSm = SizedBox(height: sm);
  static const SizedBox verticalMd = SizedBox(height: md);
  static const SizedBox verticalLg = SizedBox(height: lg);
  static const SizedBox verticalXl = SizedBox(height: xl);
  static const SizedBox verticalXxl = SizedBox(height: xxl);
  
  static const SizedBox horizontalXs = SizedBox(width: xs);
  static const SizedBox horizontalSm = SizedBox(width: sm);
  static const SizedBox horizontalMd = SizedBox(width: md);
  static const SizedBox horizontalLg = SizedBox(width: lg);
  static const SizedBox horizontalXl = SizedBox(width: xl);
}