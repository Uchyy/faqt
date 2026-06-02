import 'package:faqt/core/extensions/responsive_font.dart';
import 'package:flutter/material.dart';

class FaqtIcon extends StatelessWidget {

  const FaqtIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/faqt-icon.png",
      height: context.fontSize(FontSize.large) * 3,
    );
}
}    