import 'package:flutter/material.dart';

class AppTextTheme {
  // Heading Styles
  static const TextStyle headingXL = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    height: 1.25,
    letterSpacing: -0.5,
  );

  static const TextStyle headingLG = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    height: 1.3,
    letterSpacing: -0.3,
  );

  static const TextStyle headingMD = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    height: 1.4,
  );

  // Body Styles
  static const TextStyle bodyRegular = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    height: 1.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    height: 1.4,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    height: 1.4,
  );

  // Caption & Button
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.3,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.4,
    letterSpacing: 0.2,
  );

  // Text Theme for MaterialApp
  static TextTheme get textTheme => const TextTheme(
        displayLarge: headingXL,
        displayMedium: headingLG,
        displaySmall: headingMD,
        bodyLarge: bodyRegular,
        bodyMedium: bodyMedium, // Now using the initialized bodyMedium
        bodySmall: caption,
        labelLarge: buttonText,
      );
}
