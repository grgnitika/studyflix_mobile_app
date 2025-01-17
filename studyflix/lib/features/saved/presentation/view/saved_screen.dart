import 'package:flutter/material.dart';

class DownloadsScreen extends StatefulWidget {
  const DownloadsScreen({super.key});

  @override
  _DownloadsScreenState createState() => _DownloadsScreenState();
}

class _DownloadsScreenState extends State<DownloadsScreen> {
  final List<Map<String, String>> downloadedVideos = [
    {'title': 'Chemistry Lessons', 'image': 'assets/images/4.jpeg'},
    {'title': 'Coding Courses', 'image': 'assets/images/5.jpg'},
    {'title': 'Math Basics', 'image': 'assets/images/6.jpg'},
    {'title': 'Biology for Beginners', 'image': 'assets/images/7.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'My Playlists',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        automaticallyImplyLeading: false,
        titleSpacing: 20, // Spacing before title
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 16.0), // Space between AppBar and list
        child: downloadedVideos.isEmpty
            ? const Center(
                child: Text(
                  'No videos downloaded yet.',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              )
            : ListView.builder(
                itemCount: downloadedVideos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.asset(
                      downloadedVideos[index]['image']!,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      downloadedVideos[index]['title']!,
                      style: const TextStyle(color: Colors.white),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.white),
                      onPressed: () {
                        setState(() {
                          // Remove the video from the list
                          downloadedVideos.removeAt(index);
                        });
                      },
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                  );
                },
              ),
      ),
    );
  }
}
