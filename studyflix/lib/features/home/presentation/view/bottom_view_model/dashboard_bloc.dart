import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;

import '../../../../../app/constants/api_endpoints.dart';
import 'dashboard_event.dart';
import 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  List<Map<String, dynamic>> allCourses = []; // Store all courses
  List<String> allCategories = []; // Store all categories

  DashboardBloc({required courseRepository}) : super(DashboardInitial()) {
    on<LoadDashboardData>(_onLoadDashboardData);
    on<FilterCourses>(_onFilterCourses);
  }

  void _onLoadDashboardData(
      LoadDashboardData event, Emitter<DashboardState> emit) async {
    emit(DashboardLoading());
    try {
      final response =
          await http.get(Uri.parse('${ApiEndpoints.baseUrl}courses/'));

      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);

        // Extract unique categories if you still need them (e.g., for filtering purposes)
        allCategories = jsonData
            .map<String>((course) => course["category"]["name"].toString())
            .toSet()
            .toList();

        // Only include necessary fields: title, instructorName, and image
        allCourses = jsonData.map((course) {
          return {
            "courseId": course["_id"],
            "title": course["title"], // Course title
            "image":
                "${ApiEndpoints.imageLocationUrl}${course["image"]}", // Course image URL
          };
        }).toList();

        emit(DashboardLoaded(categories: allCategories, courses: allCourses));
      } else {
        emit(DashboardError("Failed to load courses"));
      }
    } catch (e) {
      emit(DashboardError("Error: ${e.toString()}"));
    }
  }

  void _onFilterCourses(FilterCourses event, Emitter<DashboardState> emit) {
    if (state is DashboardLoaded) {
      if (event.selectedCategories.isEmpty) {
        // If no filters are selected, show all courses
        emit(DashboardLoaded(categories: allCategories, courses: allCourses));
      } else {
        // Apply filtering based on selected categories
        List<Map<String, dynamic>> filteredCourses = allCourses
            .where((course) =>
                event.selectedCategories.contains(course["category"]))
            .toList();

        emit(DashboardLoaded(
            categories: allCategories, courses: filteredCourses));
      }
    }
  }
}
