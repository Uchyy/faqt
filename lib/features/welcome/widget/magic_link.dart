import 'package:faqt/core/extensions/responsive_font.dart';
import 'package:faqt/core/extensions/responsive_padding.dart';
import 'package:faqt/core/routes/app_routes.dart';
import 'package:faqt/core/utils/buttons/pastel_button.dart';
import 'package:faqt/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MagicLinkScreen extends StatefulWidget {
  final String email;

  const MagicLinkScreen({
    super.key,
    required this.email,
  });

  @override
  State<MagicLinkScreen> createState() => _MagicLinkScreenState();
}

class _MagicLinkScreenState extends State<MagicLinkScreen> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height * 0.2;
    return SingleChildScrollView (
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
        
          Container (
            width: double.infinity,
            height: h,
            padding: context.padding( PaddingSize.medium),
            child: Lottie.asset(
              "anims/send_email_anims.json",
              repeat: true,
            ),
          ),

          Text(
            "Check your email",
            textAlign: TextAlign.center,
            style: AppColors.cardHeader.copyWith(
              fontSize: context.fontSize(FontSize.large),
              color: AppColors.textPrimary,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 20),

          Text.rich (
            TextSpan(
              text: "Your sign-in link has been sent to ",
              style: AppColors.smallMuted,
              children: [
                TextSpan(
                  text: widget.email,
                  style: AppColors.buttonText.copyWith(
                    fontWeight: FontWeight.w900,
                    decoration: TextDecoration.none,
                  ),
                ),
                const TextSpan(
                  text: ". ",
                ),
              ],
            ),
            textAlign: TextAlign.center,
            style: AppColors.smallMuted.copyWith(
              decoration: TextDecoration.none,
            ),
          ),
          const SizedBox(height: 30),

          PastelButton(
            label: "Continue to Dashboard",
            fullWidth: true,
            labelSize: context.fontSize(FontSize.large),
            padding: context.padding(PaddingSize.medium),
            onPressed: () {
               Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
            },
          ),
          const SizedBox(height: 45),

        ],
      ),
    );
  }
}