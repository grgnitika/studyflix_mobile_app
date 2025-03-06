import 'package:studyflix/features/course/data/data_source/course_data_source.dart';
import 'package:studyflix/features/course/domain/entity/course_entity.dart';

import '../../../../../core/network/hive_service.dart';

class CourseLocalDataSource implements ICourseDataSource {
  final HiveService _hiveService;

  CourseLocalDataSource(this._hiveService);

  @override
  Future<List<CourseEntity>> getAllCourses() async {
    try {
      final courses = await _hiveService.getAllCourses();
      return courses.map((e) => e.toEntity()).toList();
    } catch (e) {
      throw Exception('Error fetching all courses: $e');
    }
  }

  @override
  Future<CourseEntity> getCourseById(String courseId) async {
    try {
      final courseHiveModel = await _hiveService.getCourseById(courseId);
      if (courseHiveModel != null) {
        return courseHiveModel.toEntity();
      } else {
        throw Exception('Course not found');
      }
    } catch (e) {
      throw Exception('Error fetching course by ID: $e');
    }
  }

  @override
  Future<List<CourseEntity>> getCoursesByCategory(String categoryId) async {
    try {
      final allCourses = await _hiveService.getAllCourses();
      final filteredCourses = allCourses
          .where((course) => course.category == categoryId)
          .map((e) => e.toEntity())
          .toList();

      if (filteredCourses.isEmpty) {
        // Depending on your application's requirements, you might want to return an empty list
        // or throw an exception if no courses are found for the given category ID.
        return filteredCourses;
      }
      return filteredCourses;
    } catch (e) {
      // Handle the error as per your application's error handling strategy
      throw Exception('Error fetching courses by category: $e');
    }
  }
}
