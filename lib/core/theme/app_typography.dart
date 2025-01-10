import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bende/core/theme/app_colors.dart';

class AppTypography {
  // Headings
  static TextStyle h1 = GoogleFonts.spaceMono(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
    height: 1.2,
  );

  static TextStyle h2 = GoogleFonts.spaceMono(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
    height: 1.2,
  );

  static TextStyle h3 = GoogleFonts.spaceMono(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
    height: 1.2,
  );

  // Body Text
  static TextStyle bodyLarge = GoogleFonts.spaceGrotesk(
    fontSize: 18,
    color: AppColors.black,
    height: 1.6,
  );

  static TextStyle bodyMedium = GoogleFonts.spaceGrotesk(
    fontSize: 16,
    color: AppColors.black,
    height: 1.6,
  );

  static TextStyle bodySmall = GoogleFonts.spaceGrotesk(
    fontSize: 14,
    color: AppColors.black,
    height: 1.6,
  );

  // Labels & Captions
  static TextStyle labelLarge = GoogleFonts.spaceMono(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.darkGray,
    letterSpacing: 1,
  );

  static TextStyle labelMedium = GoogleFonts.spaceMono(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.darkGray,
    letterSpacing: 1,
  );

  static TextStyle labelSmall = GoogleFonts.spaceMono(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: AppColors.darkGray,
    letterSpacing: 1,
  );

  // Buttons
  static TextStyle buttonLarge = GoogleFonts.spaceMono(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 1,
  );

  static TextStyle buttonMedium = GoogleFonts.spaceMono(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 1,
  );

  static TextStyle buttonSmall = GoogleFonts.spaceMono(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 1,
  );
}
