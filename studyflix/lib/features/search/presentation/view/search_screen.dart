import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // Sample data
  final List<Map<String, String>> courses = [
    {'title': 'Chemistry Lessons', 'image': 'assets/images/4.jpeg'},
    {'title': 'Coding Courses', 'image': 'assets/images/5.jpg'},
    {'title': 'Math Basics', 'image': 'assets/images/6.jpg'},
    {'title': 'Biology for Beginners', 'image': 'assets/images/7.jpg'},
  ];

  List<Map<String, String>> filteredCourses = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredCourses = courses; // Initialize with all courses
  }

  void _searchCourse(String query) {
    final List<Map<String, String>> results = courses
        .where((course) =>
            course['title']!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    setState(() {
      filteredCourses = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Search',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        titleSpacing: 20,
        automaticallyImplyLeading: false,
        actions: const [],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: TextField(
              controller: _searchController,
              onChanged: (query) => _searchCourse(query),
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[800],
                hintText: 'Search for videos...',
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: filteredCourses.isEmpty
                ? const Center(
                    child: Text(
                      'No results found.',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                : ListView.builder(
                    itemCount: filteredCourses.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Image.asset(
                          filteredCourses[index]['image']!,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          filteredCourses[index]['title']!,
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
