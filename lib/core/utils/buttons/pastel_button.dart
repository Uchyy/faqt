import 'package:faqt/core/extensions/responsive_font.dart';
import 'package:faqt/core/extensions/responsive_padding.dart';
import 'package:faqt/core/utils/colors.dart';
import 'package:flutter/material.dart';

class PastelButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final String image;
  final bool fullWidth; // asset path
  final EdgeInsetsGeometry padding;
  final double labelSize;

  const PastelButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.image = "assets/images/onboarding-bg.jpg",
    this.fullWidth = false,
    required this.padding,
    required this.labelSize,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.4;
    return Container(
      width: fullWidth ? double.infinity : width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          foregroundColor: AppColors.textPrimary,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: AppColors.buttonText.copyWith(
            fontSize: labelSize,
            fontWeight: FontWeight.w800,
            decoration: TextDecoration.none,
          ),
        ),
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}
