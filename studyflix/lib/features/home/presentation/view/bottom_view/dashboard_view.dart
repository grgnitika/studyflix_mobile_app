import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<String> carouselImages = [
    'assets/images/1.jpeg',
    'assets/images/2.jpg',
    'assets/images/3.jpeg',
  ];

  final List<Map<String, String>> continueWatching = [
    {'title': 'Chemistry', 'image': 'assets/images/4.jpeg'},
    {'title': 'Coding', 'image': 'assets/images/5.jpg'},
    {'title': 'Biology', 'image': 'assets/images/6.jpg'},
    {'title': 'Educational', 'image': 'assets/images/7.jpg'},
    {'title': 'Chemistry', 'image': 'assets/images/4.jpeg'},
    {'title': 'Coding', 'image': 'assets/images/5.jpg'},
  ];

  final List<Map<String, String>> popularOnNetflix = [
    {'title': 'Biology', 'image': 'assets/images/6.jpg'},
    {'title': 'Educational', 'image': 'assets/images/7.jpg'},
    {'title': 'Chemistry', 'image': 'assets/images/4.jpeg'},
    {'title': 'Coding', 'image': 'assets/images/5.jpg'},
    {'title': 'Educational', 'image': 'assets/images/7.jpg'},
    {'title': 'Biology', 'image': 'assets/images/6.jpg'},
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Row(
          children: [
            Icon(Icons.home, color: Colors.white),
            SizedBox(width: 6),
            Text('StudyFlix',
                style: TextStyle(color: Colors.white, fontSize: 18)),
          ],
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          // Stack for Buttons over Carousel Section
          Stack(
            children: [
              CarouselSlider(
                items: carouselImages.map((image) {
                  return Image.asset(
                    image,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 300,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 1.0,
                ),
              ),
              Positioned(
                left: 16,
                right: 16,
                bottom: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Play Button
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.play_arrow, color: Colors.white),
                      label: const Text('Play',
                          style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)),
                        minimumSize: const Size(200, 50),
                      ),
                    ),
                    // Add to Playlist Button
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.bookmark, color: Colors.white),
                      label: const Text('Add to PlayList',
                          style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)),
                        minimumSize: const Size(200, 50),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          // Continue Watching Section
          Section(
            title: 'Continue Watching',
            items: continueWatching,
          ),
          const SizedBox(height: 30),
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
  final ScrollController _controller =
      ScrollController(); // Controller for horizontal scrolling

  Section({super.key, required this.title, required this.items});

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
          child: Stack(
            children: [
              ListView.builder(
                controller: _controller,
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
              Positioned(
                right: 8,
                top: 60,
                child: IconButton(
                  icon:
                      const Icon(Icons.arrow_forward_ios, color: Colors.white),
                  onPressed: () {
                    _controller.animateTo(
                      _controller.offset + 200,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ),
              Positioned(
                left: 8,
                top: 60,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () {
                    _controller.animateTo(
                      _controller.offset - 200,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
