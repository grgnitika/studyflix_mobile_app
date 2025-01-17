import 'package:flutter/material.dart';
import 'package:studyflix/core/common/snackbar/snackbar.dart';
import 'package:studyflix/features/auth/presentation/view/register_view.dart';
import 'package:studyflix/features/home/presentation/view/home_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final String defaultEmail = "nitika";
  final String defaultPassword = "12345";

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isHoveringSignUp = false;
  bool isHoveringForgotPassword = false;

  void _login() {
    final enteredEmail = emailController.text;
    final enteredPassword = passwordController.text;

    if (enteredEmail == defaultEmail && enteredPassword == defaultPassword) {
      // If credentials match, navigate to HomeView
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeView(),
        ),
      );
      // Show success Snackbar
      Snackbar.showSnackbar(context, 'Login successful!', true);
    } else {
      // If credentials do not match, show error Snackbar
      Snackbar.showSnackbar(context, 'Invalid email or password', false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Positioned(
            top: 60,
            left: MediaQuery.of(context).size.width / 3 - 50,
            child: Image.asset(
              'assets/images/logo.png',
              height: 300,
            ),
          ),

          // Login Form Overlay
          Padding(
            padding: const EdgeInsets.only(top: 390.0),
            child: SingleChildScrollView(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.black,
                ),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Login to your account",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      TextField(
                        controller: emailController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          label: Text(
                            'Username',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          suffixIcon: Icon(
                            Icons.person,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          suffixIcon: Icon(
                            Icons.visibility_off,
                            color: Colors.blue,
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
                                    : Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Login Button
                      Container(
                        height: 55,
                        width: 240,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.blue,
                        ),
                        child: Center(
                          child: TextButton(
                            onPressed: _login,
                            child: const Text(
                              'Login',
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
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const RegisterView(),
                                      ),
                                    );
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      color: isHoveringSignUp
                                          ? Colors.blue
                                          : Colors.white,
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
