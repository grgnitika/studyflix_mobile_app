// import 'package:flutter/material.dart';
// import 'package:studyflix/features/course/presentation/view/course_view.dart';

// class HomeView extends StatelessWidget {
//   const HomeView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('StudyFlix'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Learning that gets you',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8),
//             const Text(
//               'Begin your journey to focused learning. Get Started with us now!',
//               style: TextStyle(fontSize: 16),
//             ),
//             const SizedBox(height: 24),
//             Expanded(
//               child: ListView(
//                 children: [
//                   CourseCard(
//                     title: 'Backend Oneshot Course',
//                     description: 'How the Backend Works',
//                     thumbnailUrl: 'https://via.placeholder.com/150',
//                   ),
//                   CourseCard(
//                     title: 'About Unsupervised Learning',
//                     description: 'Machine Learning Unsupervised',
//                     thumbnailUrl: 'https://via.placeholder.com/150',
//                   ),
//                   CourseCard(
//                     title: 'Learn AI Basics Series',
//                     description: 'AI Basics',
//                     thumbnailUrl: 'https://via.placeholder.com/150',
//                   ),
//                   CourseCard(
//                     title: 'Learn Cyber Security',
//                     description: 'Cybersecurity Full Course 2025',
//                     thumbnailUrl: 'https://via.placeholder.com/150',
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studyflix/core/common/app_bar/main_app_bar.dart';
import 'package:studyflix/core/theme/theme_cubit.dart';

import '../view_model/home_cubit.dart';
import '../view_model/home_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<ThemeCubit>().state.isDarkMode;

    return Scaffold(
      appBar: const MainAppBar(),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return state.views.elementAt(state.selectedIndex);
        },
      ),
      bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu_book),
                label: 'Courses',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            currentIndex: state.selectedIndex,
            selectedItemColor:
                isDarkMode ? Colors.white : const Color(0xFF9B6763),
            unselectedItemColor:
                isDarkMode ? Colors.grey[500] : const Color(0xFFB8978C),
            backgroundColor:
                isDarkMode ? const Color(0xFF121212) : Colors.white,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              context.read<HomeCubit>().onTabTapped(index);
            },
          );
        },
      ),
    );
  }
}
