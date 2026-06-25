import 'package:faqt/core/extensions/responsive_font.dart';
import 'package:faqt/core/extensions/responsive_padding.dart';
import 'package:faqt/core/utils/colors.dart';
import 'package:faqt/core/widgets/faqt_icon.dart';
import 'package:faqt/features/welcome/widget/magic_link.dart';
import 'package:faqt/features/welcome/widget/sign_in_options_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
    final screenHeight = MediaQuery.sizeOf(context).height;
    final h = screenHeight * 0.2;
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
                    const FaqtIcon(),
                    const SizedBox(width: 12),

                    Row (
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Welcome to ",
                          style: AppColors.header.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: context.fontSize(FontSize.extraLarge ) * 1.2,
                          ),    
                        ),
                        AppColors.appTitle(context),
                      ],
                    ),
                    const SizedBox(height: 8),

                    // Subheader with styling
                    Text(
                      "Keep the answers. Skip the asking.",
                      style: AppColors.smallMuted.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: context.fontSize(FontSize.normal),
                      ),
                      textAlign: TextAlign.center,
                    ),

                    Text(
                      "All with Faqts.",
                      style: AppColors.smallMuted.copyWith(
                        color: AppColors.brandGreen,
                        fontSize: context.fontSize(FontSize.normal),
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    
                    showMagicLink 
                    ? Container (
                      width: double.infinity,
                      height: h,
                      padding: context.padding( PaddingSize.medium),
                      child: Lottie.asset(
                        "anims/send_email_anims.json",
                        repeat: true,
                      ),
                    )
                    : AspectRatio(
                      aspectRatio: 20 / 9,
                      child: Image.asset(
                        "assets/images/welcome_2.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                
                    // Card container for form
                    Container(
                      constraints: BoxConstraints(
                        minHeight: screenHeight * 0.4
                      ),
                      margin: EdgeInsets.only(
                        left: context.padding(PaddingSize.small).horizontal * 0.3,
                        right: context.padding(PaddingSize.small).horizontal * 0.3,
                        top: 0,
                      ),
                      padding: EdgeInsets.only(
                        top: context.padding(PaddingSize.medium).vertical ,
                        bottom: context.padding(PaddingSize.medium).vertical,
                        left: context.padding(PaddingSize.medium).horizontal * 0.5,
                        right: context.padding(PaddingSize.medium).horizontal * 0.8,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer.withAlpha(30),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primary.withAlpha(100),
                          width: 1.5,
                        ),
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
                    const SizedBox(height: 30),

                    Align (
                      alignment: Alignment.bottomCenter,
                      child : showMagicLink
                        ? TextButton(
                            onPressed: () => setState(() => showMagicLink = false),
                            child: Text(
                              "Sign in with a different email",
                              style: AppColors.smallMuted.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: context.fontSize(FontSize.small),
                                decoration: TextDecoration.underline,
                                decorationColor: Theme.of(context).colorScheme.primary,
                                decorationThickness: 1.5,
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
                    ),
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
