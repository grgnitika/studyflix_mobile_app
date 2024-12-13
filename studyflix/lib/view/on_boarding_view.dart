import 'package:flutter/material.dart';
import 'package:studyflix/view/login_view.dart';
import 'package:studyflix/view/register_view.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool isHovering = false; // Tracks hover state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Overlay Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 300,
                  width: 300,
                ),
                const SizedBox(height: 20),
                const Text(
                  "Begin Your Journey to Focused Learning",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                // Get Started Button
                ElevatedButton(
                  onPressed: () {
                    // Navigate to Login Page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginView(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 17),
                  ),
                  child: const Text(
                    "Get Started",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w200,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(height: 10),
                // Create Account Text
                MouseRegion(
                  onEnter: (_) {
                    setState(() {
                      isHovering = true; // Change hover state
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      isHovering = false; // Reset hover state
                    });
                  },
                  child: TextButton(
                    onPressed: () {
                      // Navigate to Register Page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterView(),
                        ),
                      );
                    },
                    child: Text(
                      "Create an account",
                      style: TextStyle(
                        color: isHovering
                            ? Colors.blue
                            : Colors.white, // Change text color on hover
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
