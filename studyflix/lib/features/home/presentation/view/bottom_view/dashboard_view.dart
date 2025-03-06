import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:studyflix/core/theme/app_theme.dart';
import 'package:studyflix/features/course/presentation/view/course_card_view.dart';
import 'package:studyflix/features/course/presentation/view/single_course_view.dart';

import '../../../../../core/theme/theme_cubit.dart';
import '../bottom_view_model/dashboard_bloc.dart';
import '../bottom_view_model/dashboard_event.dart';
import '../bottom_view_model/dashboard_state.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final List<String> _selectedCategories = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.watch<ThemeCubit>();
    final isDarkMode = themeCubit.state.isDarkMode;

    return BlocProvider(
      create: (context) =>
          DashboardBloc(courseRepository: null)..add(LoadDashboardData()),
      child: Scaffold(
        backgroundColor: isDarkMode ? Colors.black : Colors.grey[100],
        appBar: AppBar(
          backgroundColor: isDarkMode ? Colors.grey[900] : primaryColor,
          title: const Text(
            'Featured Courses',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.filter_list, color: Colors.white),
              onPressed: () {
                Fluttertoast.showToast(msg: "Filter clicked");
              },
            ),
          ],
        ),
        body: BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) {
            if (state is DashboardLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is DashboardLoaded) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category Filters
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "Categories",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Wrap(
                      spacing: 10,
                      children: state.categories.map((category) {
                        return FilterChip(
                          checkmarkColor: Colors.white,
                          label: Text(category),
                          selected: _selectedCategories.contains(category),
                          selectedColor: secondaryColor,
                          labelStyle: TextStyle(
                            color: _selectedCategories.contains(category)
                                ? Colors.white
                                : (isDarkMode ? Colors.white : Colors.black),
                          ),
                          backgroundColor:
                              isDarkMode ? Colors.grey[700] : Colors.grey[300],
                          onSelected: (bool selected) {
                            setState(() {
                              if (selected) {
                                _selectedCategories.add(category);
                              } else {
                                _selectedCategories.remove(category);
                              }
                            });
                            context.read<DashboardBloc>().add(
                                FilterCourses(List.from(_selectedCategories)));
                          },
                        );
                      }).toList(),
                    ),
                  ),

                  // Workshop Grid (Using the separate component)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "Courses",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  CourseCardView(
                    // courses: state.courses,
                    onTap: (courseId) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SingleCourseView(courseId: courseId),
                        ),
                      );
                    },
                    courses: const [],
                  ),
                ],
              );
            } else if (state is DashboardError) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            } else {
              return const Center(child: Text("Something went wrong"));
            }
          },
        ),
      ),
    );
  }
}
