import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<String> carouselImages = [
    'assets/images/1.jpeg',
    'assets/images/2.jpg',
    'assets/images/3.jpeg',
  ];

  final List<Map<String, String>> continueWatching = [
    {'title': 'Chemistry Lessons', 'image': 'assets/images/4.jpeg'},
    {'title': 'Coding Courses', 'image': 'assets/images/5.jpg'},
  ];

  final List<Map<String, String>> popularOnNetflix = [
    {'title': 'Biology Lesson', 'image': 'assets/images/6.jpg'},
    {'title': 'Educational Courses', 'image': 'assets/images/7.jpg'},
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          // Carousel Section
          CarouselSlider(
            items: carouselImages.map((image) {
              return Image.asset(image, fit: BoxFit.cover);
            }).toList(),
            options: CarouselOptions(
              height: 200,
              autoPlay: true,
              enlargeCenterPage: true,
            ),
          ),
          const SizedBox(height: 16),
          // Continue Watching Section
          Section(
            title: 'Continue Watching',
            items: continueWatching,
          ),
          const SizedBox(height: 16),
          // Popular on Studyflix Section
          Section(
            title: 'Popular on Studyflix',
            items: popularOnNetflix,
          ),
        ],
      ),
    );
  }
}

class Section extends StatelessWidget {
  final String title;
  final List<Map<String, String>> items;

  const Section({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    Image.asset(
                      items[index]['image']!,
                      height: 120,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      items[index]['title']!,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
