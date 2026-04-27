import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lms_mobileapp/core/constants/app_routes.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';
import 'package:lms_mobileapp/core/log/app_logger.dart';
import 'package:lms_mobileapp/core/network/dio_network.dart';
import 'package:lms_mobileapp/features/auth/presentation/screens/login_screen.dart';
import 'package:lms_mobileapp/features/init/presentation/screens/onboarding_screen.dart';
import 'package:lms_mobileapp/features/init/presentation/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize logger
  initRootLogger();

  // Load environment variables
  await dotenv.load(fileName: ".env");

  // Initialize Hive
  await Hive.initFlutter();

  // Initialize Dio
  await DioNetwork.initDio(30); // 30 seconds timeout

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Emebet's Academy",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        scaffoldBackgroundColor: AppColors.background,
        textTheme: AppTextTheme.textTheme,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: AppColors.textPrimary),
        ),
      ),
      home: const SplashScreen(),
      routes: {
        AppRoutes.splash: (_) => const SplashScreen(),
        AppRoutes.onboarding: (_) => const OnboardingScreen(),
        AppRoutes.login: (_) => const LoginScreen(),
      },
    );
  }
}
