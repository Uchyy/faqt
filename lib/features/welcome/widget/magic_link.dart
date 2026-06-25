import 'package:faqt/core/extensions/responsive_font.dart';
import 'package:faqt/core/extensions/responsive_padding.dart';
import 'package:faqt/core/routes/app_routes.dart';
import 'package:faqt/core/utils/buttons/pastel_button.dart';
import 'package:faqt/core/utils/colors.dart';
import 'package:flutter/material.dart';

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
    return SingleChildScrollView (
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        
          Text(
            "Check your email",
            textAlign: TextAlign.center,
            style: AppColors.cardHeader.copyWith(
              fontSize: context.fontSize(FontSize.large) * 1.3,
              color: Theme.of( context).colorScheme.primary,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 20),

          Text.rich (
            TextSpan(
              text: "Your sign-in link has been sent to ",
              style: AppColors.smallMuted.copyWith(
                fontSize: context.fontSize(FontSize.normal),
              ),
              children: [
                TextSpan(
                  text: widget.email,
                  style: AppColors.buttonText.copyWith(
                    fontWeight: FontWeight.w900,
                    decoration: TextDecoration.none,
                    color: Theme.of(context).colorScheme.primary,
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
          const SizedBox(height: 100),

          PastelButton(
            label: "Continue to Dashboard",
            fullWidth: true,
            labelSize: context.fontSize(FontSize.large),
            padding: context.padding(PaddingSize.medium),
            onPressed: () {
               Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
            },
          ),

        ],
      ),
    );
  }
}