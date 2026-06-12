import 'package:faqt/core/extensions/responsive_font.dart';
import 'package:faqt/core/extensions/responsive_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GreyButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String labelText;
  final String svgPath; // ← changed

  const GreyButton({
    super.key,
    required this.onPressed,
    required this.labelText,
    required this.svgPath, // ← changed
  });

  @override
  Widget build(BuildContext context) {
    //final height = MediaQuery.of(context).size.height * 0.08;

    return SizedBox(
      width: double.infinity,
      //height: height,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          iconAlignment: IconAlignment.start,
          backgroundColor: Theme.of(context).brightness == Brightness.dark
            ?Theme.of(context).colorScheme.secondary
            : Theme.of(context).colorScheme.surface.withAlpha(5),
          foregroundColor: Theme.of(context).colorScheme.primary,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: Theme.of( context).colorScheme.outline.withOpacity(0.4) == Colors.transparent
              ? BorderSide.none
              : BorderSide(
                  color: Theme.of(context).colorScheme.outline.withOpacity(0.4),
                  width: 1,
                ),
          ),
          padding: EdgeInsets.symmetric(
            vertical: context.padding(PaddingSize.small).vertical * 1.3,
            horizontal: context.padding(PaddingSize.large).horizontal,
          ),
        ),

        // ⭐ SVG ICON HERE
        icon: SvgPicture.asset(
          svgPath,
          height: context.fontSize(FontSize.large),
          width: context.fontSize(FontSize.extraLarge),
        ),

        label: Text(
          labelText,
          style: TextStyle(
            fontSize: context.fontSize(FontSize.normal),
            fontWeight: FontWeight.w800,  
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
