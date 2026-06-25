import 'package:faqt/core/extensions/responsive_font.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  // ======================
  // CORE APP THEME (Black & White)
  // ======================
  static const background = Color(0xFFFFFFFF); // white
  static const backgroundDark = Color(0xFF000000); // black

  static const surface = Color(0xFFFFFFFF);
  static const surfaceDark = Color(0xFF1A1A1A);

  static const textPrimary = Color(0xFF000000);
  static const textSecondary = Color(0xFF6A6A6A);
  static const textPrimaryDark = Color(0xFFFFFFFF);
  static const textSecondaryDark = Color(0xFFCCCCCC);

  // Neutral core
  static const black = Color(0xFF000000);
  static const white = Color(0xFFFFFFFF);
  static const grey = Color(0xFFBDBDBD);
  static const greyDark = Color(0xFF6E6E6E);
  static const greyLight = Color(0xFFE0E0E0);

  // ======================
  // BRAND ELEMENTS
  // ======================
  static const brandGreen = Color(0xFF60A9AE);
  static const brandBlack = Color(0xFF000000);
  static const brandWhite = Color(0xFFFFFFFF);

  // ======================
  // CATEGORY PASTELS (Cards)
  // ======================
  static const pastelLilac = Color(0xFFEDE7F6);     // Contacts
  static const pastelPeach = Color(0xFFFFE4D4);     // How‑to
  static const pastelMint = Color(0xFFDFF8F2);      // Utilities
  static const pastelBlue = Color(0xFFE3F2FD);      // Info
  static const pastelYellow = Color(0xFFFFF7CC);    // Notes
  static const pastelPink = Color(0xFFFFE0F0);      // Misc

  // ======================
  // ACCENTS
  // ======================
  static const accentRed = Color(0xFFE46C5D);
  static const accentPink = Color(0xFFFF4EAE);
  static const accentGrey = Color(0xFFBDBDBD);

  // ======================
  // SHADOWS
  // ======================
  static BoxShadow softShadow(bool isDark) => BoxShadow(
        color: isDark ? Colors.black26 : Colors.black12,
        blurRadius: 8,
        offset: const Offset(0, 3),
      );

  // ======================
  // TEXT STYLES (Simplified)
  // ======================
  static TextStyle header = GoogleFonts.playfairDisplay(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.15,
  );
  
  static TextStyle title = GoogleFonts.comfortaa(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
  );

  static TextStyle cardHeader = GoogleFonts.notoSerif(
    fontWeight: FontWeight.w600,
  );

  static TextStyle cardDescription = GoogleFonts.inter(
    height: 1.4,
    fontWeight: FontWeight.w400,
  );

  static TextStyle smallMuted = GoogleFonts.comfortaa(
    color: textSecondary,
  );

  static TextStyle buttonText = GoogleFonts.kalam(
    color: textSecondary,
  );

  // ======================
  // GRADIENTS (Optional)
  // ======================
  static const LinearGradient softFade = LinearGradient(
    colors: [
      Color(0xFFFFFFFF),
      Color(0xFFF7F7F7),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // ======================
  // BRAND TITLE WIDGET
  // ======================
  static Widget appTitle(BuildContext context) {
    return Text(
      "Faqt",
      style: GoogleFonts.playfairDisplay(
        fontSize: context.fontSize(FontSize.extraLarge) * 1.2,
        fontWeight: FontWeight.w800,
        color: const Color.fromRGBO(96, 169, 174, 1),
      ),
    );
  }
}
