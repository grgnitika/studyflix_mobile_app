import 'package:flutter/material.dart';
import 'package:studyflix/features/home/presentation/view/bottom_view/dashboard_view.dart';
import 'package:studyflix/features/profile/presentation/view/profile_screen.dart';
import 'package:studyflix/features/saved/presentation/view/saved_screen.dart';
import 'package:studyflix/features/search/presentation/view/search_screen.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  // List of screens for Bottom Navigation
  final List<Widget> _screens = [
    HomeScreen(),
    const DownloadsScreen(),
    const SearchScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black, // Set the background color to blue
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue, // Set the selected icon color to white
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
            label: 'My Playlist',
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
