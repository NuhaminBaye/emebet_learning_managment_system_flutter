import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF23C55E); 
  static const Color primaryDark = Color(0xFF16a34a); 
  static const Color primaryLight = Color(0xFFdcfce7);

  // Secondary Colors (Supporting Greens)
  static const Color secondary = Color(0xFF15803d);
  static const Color secondaryDark = Color(0xFF14532d);

  // Accent Colors
  static const Color accent = Color(0xFF23C55E);
  static const Color link = Color(0xFF23C55E);

  // Neutral Colors
  static const Color background = Color(0xFFF9FAFB);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color disabled = Color(0xFFE5E7EB);

  // Text Colors
  static const Color textPrimary = Color(0xFF111827);
  static const Color textSecondary = Color(0xFF374151);
  static const Color textDisabled = Color(0xFF9CA3AF);
  static const Color textOnPrimary = Color(0xFFFFFFFF);
  static const Color textOnSecondary = Color(0xFFFFFFFF);

  // Status Colors
  static const Color success = Color(0xFF22c55e);
  static const Color warning = Color(0xFFf59e0b);
  static const Color error = Color(0xFFef4444);
  static const Color info = Color(0xFF3b82f6);

  // Border Colors
  static const Color border = Color(0xFFE5E7EB);
  static const Color borderDark = Color(0xFFD1D5DB);

  // Grey Scale
  static const Color grey900 = Color(0xFF111827);
  static const Color grey800 = Color(0xFF1F2937);
  static const Color grey700 = Color(0xFF374151);
  static const Color grey600 = Color(0xFF4B5563);
  static const Color grey500 = Color(0xFF6B7280);
  static const Color grey400 = Color(0xFF9CA3AF);
  static const Color grey300 = Color(0xFFD1D5DB);
  static const Color grey200 = Color(0xFFE5E7EB);
  static const Color grey100 = Color(0xFFF3F4F6);
  static const Color grey50 = Color(0xFFF9FAFB);

  // Semantic Aliases
  static Color get primaryColor => primary;
  static Color get primaryBlack => textPrimary;
  static Color get primaryGrey => grey600;
  static Color get primaryRed => error;
  static Color get blackBold => grey900;
}