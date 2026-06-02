import 'package:faqt/core/extensions/responsive_font.dart';
import 'package:faqt/core/extensions/responsive_padding.dart';
import 'package:flutter/material.dart';

class GreyButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String labelText;
  final IconData icon;

  const GreyButton({
    super.key,
    required this.onPressed,
    required this.labelText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.08;

    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          iconAlignment: IconAlignment.start,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: BorderSide(color: Colors.grey.shade300),
          ),
          padding: context.padding(PaddingSize.large),
          textStyle: TextStyle(
            fontSize: context.fontSize(FontSize.large),
            fontWeight: FontWeight.w800,
          ),
        ),
        icon: Icon(icon, size: 24), 
        label: Text (labelText), // You can replace this with the Google logo
      ),
    );
  }
}
