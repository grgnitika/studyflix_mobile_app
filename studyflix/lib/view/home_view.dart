import 'package:flutter/material.dart';
import 'package:studyflix/view/profile_screen.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  // List of screens for Bottom Navigation
  final List<Widget> _screens = [
    const Center(child: Text("Home Screen")),
    const Center(child: Text("Saved Screen")),
    const Center(child: Text("Search Screen")),
    const ProfileScreen(), // Updated to navigate to ProfileScreen
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(), // Removes the default back arrow
        title: const Text(
          "StudyFlix",
          style: TextStyle(
            color: Colors.white, // Set the title font color to white
          ),
        ),
        backgroundColor: Colors.blue,
        elevation: 0, // Optional: to remove shadow for a cleaner look
        toolbarHeight:
            kToolbarHeight, // Optional: ensures the height of the AppBar remains consistent
        automaticallyImplyLeading:
            false, // To prevent default leading widget like the back button
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue, // Set the background color to blue
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.white, // Set the selected icon color to white
        unselectedItemColor:
            Colors.white, // Set the unselected icon color to white
        type: BottomNavigationBarType
            .fixed, // Ensure the fixed type for better color handling
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
