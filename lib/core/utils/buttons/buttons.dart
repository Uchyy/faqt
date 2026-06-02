import 'package:faqt/core/extensions/responsive_font.dart';
import 'package:faqt/core/extensions/responsive_padding.dart';
import 'package:faqt/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ButtonStyle pastelButtonStyle(BuildContext context) {
  return ElevatedButton.styleFrom(
    backgroundColor: AppColors.pastelLilac,   // 💜 pastel colour here
    foregroundColor: AppColors.textPrimary,   // black text
    padding: context.padding( PaddingSize.medium),
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(14),
    ),
    textStyle: AppColors.buttonText.copyWith(
      fontSize: context.fontSize(FontSize.normal),
      fontWeight: FontWeight.w600,
    ),
  );
}

ButtonStyle blackButtonStyle(BuildContext context) {
  return ElevatedButton.styleFrom(
    backgroundColor: AppColors.surfaceDark,
    foregroundColor: AppColors.textPrimaryDark,
    padding: context.padding( PaddingSize.medium),
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(14),
    ),
    textStyle: TextStyle(
      fontSize: context.fontSize(FontSize.normal),
      fontWeight: FontWeight.w600,
      fontFamily: GoogleFonts.inter().fontFamily,
    ),
  );
}



ButtonStyle whiteButtonStyle(BuildContext context) {
  return ElevatedButton.styleFrom(
    backgroundColor: AppColors.background,
    foregroundColor: AppColors.textPrimary,
    padding: context.padding( PaddingSize.medium),
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(14),
      side: BorderSide(color: AppColors.surfaceDark, width: 2),
    ),
    textStyle: TextStyle(
      fontSize: context.fontSize(FontSize.normal),
      fontWeight: FontWeight.w600,
      fontFamily: GoogleFonts.inter().fontFamily,
    ),
  );
}

