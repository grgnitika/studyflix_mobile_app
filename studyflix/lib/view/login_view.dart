import 'package:flutter/material.dart';
import 'package:studyflix/view/dashboard_view.dart';
import 'package:studyflix/view/register_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isHoveringSignUp = false; // Tracks hover state for "Sign Up"
  bool isHoveringForgotPassword =
      false; // Tracks hover state for "Forgot Password?"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image and overlay with logo
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                // Logo Overlay, now larger and centered
                Positioned(
                  top: MediaQuery.of(context).size.height / 3 -
                      170, // Center the logo vertically with a larger size
                  left: MediaQuery.of(context).size.width / 2 -
                      150, // Center the logo horizontally
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 200, // Increased size of the logo to 200
                    width: 300, // Increased size of the logo to 200
                  ),
                ),
              ],
            ),
          ),
          // Bottom section with form fields
          Padding(
            padding: const EdgeInsets.only(
                top:
                    310.0), // Adjusted padding to accommodate larger logo and text
            child: SingleChildScrollView(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.black,
                ),
                height: MediaQuery.of(context)
                    .size
                    .height, // Use the full screen height
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 40), // Space above the text
                      Align(
                        alignment:
                            Alignment.centerLeft, // Align text to the left
                        child: const Text(
                          "Login to your account", // Title text
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 25), // Space before username field
                      // Username TextField
                      const TextField(
                        style: TextStyle(
                            color: Colors.white), // Set text color to white
                        decoration: InputDecoration(
                          label: Text(
                            'Username',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          suffixIcon: Icon(
                            Icons.person, // Username icon on the right
                            color: Colors.blue, // Set icon color to blue
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Password TextField
                      const TextField(
                        obscureText: true, // Ensures password security
                        style: TextStyle(
                            color: Colors.white), // Set text color to white
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.visibility_off,
                            color: Colors.blue, // Set icon color to blue
                          ),
                          label: Text(
                            'Password',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Forgot Password as TextButton with Hover Effect
                      Align(
                        alignment: Alignment.centerRight,
                        child: MouseRegion(
                          onEnter: (_) {
                            setState(() {
                              isHoveringForgotPassword = true;
                            });
                          },
                          onExit: (_) {
                            setState(() {
                              isHoveringForgotPassword = false;
                            });
                          },
                          child: TextButton(
                            onPressed: () {
                              print("Forgot Password clicked");
                            },
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: isHoveringForgotPassword
                                    ? Colors.blue
                                    : Colors
                                        .white, // Change text color on hover
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                          height:
                              20), // Reduced space between Sign In button and "New to StudyFlix?" text
                      Container(
                        height: 55,
                        width: 240,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blue,
                        ),
                        child: Center(
                          child: TextButton(
                            onPressed: () {
                              // Navigate to the Dashboard page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const DashBoardScreen(), // Replace with your Dashboard page
                                ),
                              );
                            },
                            child: const Text(
                              'Sign in',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: MouseRegion(
                            onEnter: (_) {
                              setState(() {
                                isHoveringSignUp = true;
                              });
                            },
                            onExit: (_) {
                              setState(() {
                                isHoveringSignUp = false;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "New to StudyFlix? ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    // Navigate to the Register page
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const RegisterView(), // Replace with your Register page
                                      ),
                                    );
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero, // Remove padding
                                  ),
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      color: isHoveringSignUp
                                          ? Colors.blue
                                          : Colors.white, // Hover color
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
