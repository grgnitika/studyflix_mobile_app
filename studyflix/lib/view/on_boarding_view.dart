import 'package:flutter/material.dart';

import 'login_view.dart'; // Import the LoginView page

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "title": "Welcome to StudyFlix!",
      "subtitle":
          "Stream unlimited educational videos tailored to your learning needs. Study smarter with StudyFlix.",
      "image": "assets/images/1.jpg", // Replace with your image path
    },
    {
      "title": "Focused Learning",
      "subtitle":
          "Say goodbye to distractions and focus on what truly matters: your education. Only educational content here!",
      "image": "assets/images/img1.jpg", // Replace with your image path
    },
    {
      "title": "Search & Discover",
      "subtitle":
          "Quickly find what you need. Explore trending topics and enhance your knowledge anytime, anywhere.",
      "image": "assets/images/a.jpg", // Replace with your image path
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: onboardingData.length,
            itemBuilder: (context, index) {
              return OnboardingPage(
                title: onboardingData[index]["title"]!,
                subtitle: onboardingData[index]["subtitle"]!,
                image: onboardingData[index]["image"]!,
              );
            },
          ),
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                (index) => buildDot(index, context),
              ),
            ),
          ),
          if (_currentPage == onboardingData.length - 1)
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to LoginView
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginView()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Blue button background
                    minimumSize: const Size(150, 50),
                  ),
                  child: const Text(
                    "Get Started",
                    style: TextStyle(
                        fontSize: 16, color: Colors.white), // White text
                  ),
                ),
              ),
            )
          else
            Positioned(
              bottom: 20,
              left: 16,
              right: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      _controller.jumpToPage(onboardingData.length - 1);
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Blue button background
                      minimumSize: const Size(100, 50),
                    ),
                    child: const Text(
                      "Next",
                      style: TextStyle(
                          fontSize: 16, color: Colors.white), // White text
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  AnimatedContainer buildDot(int index, BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 10,
      width: _currentPage == index ? 20 : 10,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.blue : Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Wrap the image with Transform.scale for zoom-out effect
        Transform.scale(
          scale: 0.9, // Adjust this value to control the zoom-out effect
          child: SizedBox(
            width: double.infinity, // Ensure the image takes up the full width
            height:
                double.infinity, // Ensure the image takes up the full height
            child: Image.asset(
              image,
              fit: BoxFit.cover, // Ensures the image covers the screen area
            ),
          ),
        ),
        Container(
          color: Colors.black.withOpacity(0.5), // Dark overlay for readability
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                subtitle,
                style: const TextStyle(fontSize: 16, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
