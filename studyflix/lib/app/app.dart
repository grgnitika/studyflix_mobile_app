import 'package:flutter/material.dart';
import 'package:studyflix/features/auth/presentation/view/login_view.dart';
import 'package:studyflix/features/onboarding/presentation/view/on_boarding_view.dart';
import 'package:studyflix/features/splash/presentation/view/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/onboarding': (context) => const OnBoardingView(),
        '/login': (context) => const LoginView(),
      },
    );
  }
}
