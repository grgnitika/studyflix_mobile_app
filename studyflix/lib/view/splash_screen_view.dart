import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _logoController;
  late final Animation<double> _logoScaleAnimation;
  late final Animation<double> _logoJumpAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(
          seconds: 2), // Increased duration for better visibility
    );

    // Scale animation for "pop" effect
    _logoScaleAnimation = CurvedAnimation(
      parent: _logoController,
      curve: Curves.easeOutBack,
    );

    // Jump animation for "bounce" effect
    _logoJumpAnimation = Tween<double>(begin: 0, end: -30).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: Curves.bounceOut,
      ),
    );

    // Start the animation
    _logoController.forward();

    // Navigate to the next screen after the splash screen
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/onboarding');
    });
  }

  @override
  void dispose() {
    _logoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: Center(
          child: AnimatedBuilder(
            animation: _logoController,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _logoJumpAnimation.value),
                child: ScaleTransition(
                  scale: _logoScaleAnimation,
                  child: child,
                ),
              );
            },
            child: Image.asset(
              'assets/images/logo.png',
              height: 250, // Logo size
              width: 250, // Logo size
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 100,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
