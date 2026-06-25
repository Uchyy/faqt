import 'package:faqt/core/extensions/responsive_font.dart';
import 'package:faqt/core/utils/buttons/pastel_button.dart';
import 'package:faqt/core/utils/colors.dart';
import 'package:faqt/core/widgets/faqt_icon.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:faqt/core/extensions/responsive_padding.dart';
import 'package:faqt/core/routes/app_routes.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  int index = 0;

  final images = [
    "assets/images/Faqt1.png",
    "assets/images/Faqt2.png",
    "assets/images/Faqt3.png",
  ];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> finishOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seenOnboarding', true);

    if (!mounted) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    });
  }

 @override
Widget build(BuildContext context) {
  final height = MediaQuery.of(context).size.height;

  return Scaffold(
    body: SafeArea(
      minimum: context.padding(PaddingSize.medium),
      child: Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.0),
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
              Colors.white,
              Colors.white,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FaqtIcon(),
            
            Expanded(
              child: PageView.builder(
                controller: controller,
                onPageChanged: (i) => setState(() => index = i),
                itemCount: images.length,
                itemBuilder: (context, i) {
                  return Center(
                    child: Image.asset(
                      images[i],
                      fit: BoxFit.contain,
                      width: double.infinity,
                    ),
                  );
                },
              ),
            ),

            // Dots indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(images.length, (i) {
                final active = i == index;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: active ? 18 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: active
                        ? AppColors.brandGreen.withAlpha(50)
                        : AppColors.brandGreen,
                    borderRadius: BorderRadius.circular(20),
                  ),
                );
              }),
            ),

            Padding(
              padding: context.padding(PaddingSize.medium),
              child: PastelButton(
                onPressed: () {
                  if (index == images.length - 1) {
                    finishOnboarding();
                  } else {
                    controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                label: index == images.length - 1 ? "Get Started" : "Next",
                padding: context.padding(PaddingSize.small),
                labelSize: context.fontSize(FontSize.normal),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

}
