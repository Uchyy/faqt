import 'package:faqt/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FaqtTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    // PURE NEUTRAL BASE
    colorScheme: const ColorScheme.light(
      primary: AppColors.black,          // buttons, icons, highlights
      onPrimary: AppColors.white,
      secondary: AppColors.grey,         // subtle accents
      onSecondary: AppColors.black,
      surface: AppColors.white,
      onSurface: AppColors.black,
      background: AppColors.white,
      onBackground: AppColors.black,
    ),

    scaffoldBackgroundColor: AppColors.white,

    textTheme: GoogleFonts.interTextTheme().copyWith(
      headlineMedium: GoogleFonts.inter(
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
      bodyMedium: GoogleFonts.inter(
        color: AppColors.greyDark,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    colorScheme: const ColorScheme.dark(
      primary: AppColors.white,
      onPrimary: AppColors.black,
      secondary: AppColors.greyLight,
      onSecondary: AppColors.black,
      surface: AppColors.black,
      onSurface: AppColors.white,
      background: AppColors.black,
      onBackground: AppColors.white,
    ),

    scaffoldBackgroundColor: AppColors.black,

    textTheme: GoogleFonts.interTextTheme().copyWith(
      headlineMedium: GoogleFonts.inter(
        fontWeight: FontWeight.w600,
        color: AppColors.white,
      ),
      bodyMedium: GoogleFonts.inter(
        color: AppColors.greyLight,
      ),
    ),
  );
}
