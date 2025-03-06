import 'package:studyflix/features/course/domain/entity/course_entity.dart';

abstract interface class ICourseDataSource {
  Future<List<CourseEntity>> getAllCourses();

  Future<CourseEntity> getCourseById(String courseId);

  Future<List<CourseEntity>> getCoursesByCategory(String categoryId);
}
