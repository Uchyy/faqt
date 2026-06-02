import 'package:faqt/core/extensions/responsive_font.dart';
import 'package:faqt/core/extensions/responsive_padding.dart';
import 'package:faqt/core/utils/colors.dart';
import 'package:faqt/core/widgets/faqt_icon.dart';
import 'package:faqt/features/welcome/widget/magic_link.dart';
import 'package:faqt/features/welcome/widget/sign_in_options_page.dart';
import 'package:flutter/material.dart';

class SigInScreen extends StatefulWidget {
  const SigInScreen({super.key});

  @override
  State<SigInScreen> createState() => _SigInScreenState();
}

class _SigInScreenState extends State<SigInScreen> {
  bool showMagicLink = false;
  String userEmail = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 950),
              child: Padding(
                padding: context.padding(PaddingSize.medium),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),

                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const FaqtIcon(),
                        const SizedBox(width: 12),
                        Text(
                          "Welcome to Faqt",
                          style: AppColors.title.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: context.fontSize(FontSize.extraLarge),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    // Subheader with styling
                    Container(
                      padding: context.padding(PaddingSize.small),
                      decoration: BoxDecoration(
                        color: AppColors.pastelMint.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "Stay organised. Stay informed. Stay in Faqt.",
                        style: AppColors.smallMuted.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: context.fontSize(FontSize.large),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Illustration
                    Image.asset(
                      "assets/images/welcome-1.png",
                      height: MediaQuery.of(context).size.height * 0.25,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 40),

                
                    // Card container for form
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: showMagicLink
                            ? MagicLinkScreen(email: userEmail)
                            : SignInOptionsPage(
                                onMagicLinkSent: (email) {
                                  setState(() {
                                    showMagicLink = true;
                                    userEmail = email;
                                  });
                                },
                              ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Footer
                    showMagicLink
                        ? TextButton(
                            onPressed: () => setState(() => showMagicLink = false),
                            child: Text(
                              "Sign in with a different email",
                              style: AppColors.smallMuted.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: context.fontSize(FontSize.small),
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child:  Text.rich(
                              TextSpan (
                                text: "By signing in, you agree to our ",
                                style: AppColors.smallMuted.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: context.fontSize(FontSize.small),
                                  decoration: TextDecoration.none,
                                ),
                                children: [
                                  TextSpan(
                                    text: "Terms of Service",
                                    style: AppColors.smallMuted.copyWith(
                                      color: Theme.of(context).colorScheme.primary,
                                      fontSize: context.fontSize(FontSize.small),
                                      decoration: TextDecoration.underline,
                                      decorationColor: Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                  TextSpan(
                                    text: " and ",
                                    style: AppColors.smallMuted.copyWith(
                                      color: Theme.of(context).colorScheme.primary  ,
                                      fontSize: context.fontSize(FontSize.small),
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Privacy Policy",
                                    style: AppColors.smallMuted.copyWith(
                                      color: Theme.of(context).colorScheme.primary,
                                      fontSize: context.fontSize(FontSize.small),
                                      decoration: TextDecoration.underline,
                                      decorationColor: Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                ],
                              ),
                            textAlign: TextAlign.center,
                          )
                          ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
