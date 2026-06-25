import 'package:faqt/core/routes/app_router.dart';
import 'package:faqt/core/routes/app_routes.dart';
import 'package:faqt/core/theme/themedata.dart';
import 'package:faqt/features/dashboard/dashboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {
 WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final bool isFirstTime = prefs.getBool('is_first_time') ?? true;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HubProvider()),
      ], 
      child:
       FaqtApp(isFirstTime: isFirstTime),
    ),
  );
}

class FaqtApp extends StatelessWidget {
  final bool isFirstTime;
  const FaqtApp({super.key, required this.isFirstTime});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Faqt",
      debugShowCheckedModeBanner: false,
      theme: FaqtTheme.lightTheme,
      darkTheme: FaqtTheme.darkTheme,
      themeMode: ThemeMode.system,

      initialRoute: isFirstTime
          ? AppRoutes.onboarding
          : AppRoutes.login,

      onGenerateRoute: AppRouter.generate,
    );
  }
}

