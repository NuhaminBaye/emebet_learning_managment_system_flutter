import 'package:flutter/material.dart';

/// Design tokens for the instructor module (matches UI mockups).
abstract final class InstructorDesign {
  static const Color primary = Color(0xFF2ECC71);
  static const Color canvas = Color(0xFFF8F9FB);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceMuted = Color(0xFFEBF2FF);
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF7F8C8D);
  static const Color textTertiary = Color(0xFF757575);
  static const Color chipInactiveBg = Color(0xFFE8EEF5);
  static const Color revenueCard = primary;

  static const double radiusCard = 24;
  static const double radiusControl = 14;
  static const double radiusChip = 12;

  static const EdgeInsets screenPadding = EdgeInsets.symmetric(horizontal: 20);

  static List<BoxShadow> cardShadow(BuildContext context) => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.06),
          blurRadius: 16,
          offset: const Offset(0, 6),
        ),
      ];

  static List<BoxShadow> fabShadow(BuildContext context) => [
        BoxShadow(
          color: primary.withValues(alpha: 0.35),
          blurRadius: 16,
          offset: const Offset(0, 8),
        ),
      ];
}
