import 'package:faqt/core/extensions/responsive_font.dart';
import 'package:faqt/core/extensions/responsive_padding.dart';
import 'package:faqt/core/routes/app_routes.dart';
import 'package:faqt/core/utils/colors.dart';
import 'package:faqt/core/utils/buttons/pastel_button.dart';
import 'package:faqt/core/widgets/faqt_icon.dart';
import 'package:faqt/core/widgets/image_carousel.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold (
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.padding(PaddingSize.small).horizontal, vertical: context.padding(PaddingSize.large).vertical),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row (
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    FaqtIcon(),

                    // Heading
                    Text(
                      "Welcome to Faqt",
                      style: AppColors.title.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: context.fontSize(FontSize.extraLarge),
                        decoration: TextDecoration.none,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // Subheading
                Text(
                  "Your facts, tidy and always within reach.",
                  style: AppColors.smallMuted.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: context.fontSize(FontSize.large),
                    decoration: TextDecoration.none,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: context.fontSize(FontSize.large)),

                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 700,
                  ),
                  child: Column(
                    children: [
                      ImageCarousel(
                        images: [
                          "assets/images/1.png",
                          "assets/images/2.png",
                          "assets/images/3.png",
                        ],
                      ),

                      SizedBox(height: context.fontSize(FontSize.extraLarge) * 3),
                      Align (
                        alignment: Alignment.centerRight,
                        child: PastelButton(
                          label: "Get Started",
                          image: "assets/images/onboarding-bg.jpg",
                          padding: context.padding(PaddingSize.medium),
                          labelSize: context.fontSize(FontSize.extraLarge),
                          onPressed: () async {
                            final prefs = await SharedPreferences.getInstance();
                            await prefs.setBool('seenOnboarding', true);

                            Navigator.pushReplacementNamed(context, AppRoutes.login);

                          },
                        ),
                      ), 
                    ]
                  )
                ), 
  
              ],
            ),
          ),
        ),
      ),
    );
  }
}