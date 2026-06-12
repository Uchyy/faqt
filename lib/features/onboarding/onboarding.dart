import 'package:faqt/core/extensions/responsive_font.dart';
import 'package:faqt/core/extensions/responsive_padding.dart';
import 'package:faqt/core/routes/app_routes.dart';
import 'package:faqt/core/utils/buttons/pastel_button.dart';
import 'package:faqt/core/widgets/image_carousel.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold (
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Stack(
        alignment: Alignment.bottomCenter, 
        children: [
          ImageCarousel(
            images: [
              "assets/images/1.png",
              "assets/images/2.png",
              "assets/images/3.png",
            ],
          ),

          Padding (
            padding: const EdgeInsets.only(bottom: 100), 
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
          )
         
        ],
      )
    );
  }
}