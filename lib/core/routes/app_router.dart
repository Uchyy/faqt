import 'package:faqt/core/routes/app_routes.dart';
import 'package:faqt/features/onboarding/onboarding.dart';
import 'package:faqt/features/dashboard/dashboard.dart';
import 'package:faqt/features/welcome/sign_in.dart';
import 'package:flutter/material.dart';
import 'transitions.dart';

class AppRouter {
  static Route<dynamic> generate(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return FadeRoute(page: const SigInScreen());

      case AppRoutes.onboarding:
        return SlideFromRightRoute(page: const OnboardingScreen());

      case AppRoutes.magicLinkSent:
        //return FadeRoute(page: const MagicLinkSentScreen());

      case AppRoutes.dashboard:
        return SlideFromRightRoute(page: const DashboardScreen());

      default:
        return FadeRoute(page: const SigInScreen());
    }
  }
}
