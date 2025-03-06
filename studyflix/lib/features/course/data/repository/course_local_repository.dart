import 'package:dartz/dartz.dart';
import 'package:studyflix/features/course/data/data_source/local_datasource/course_local_data_source.dart';
import 'package:studyflix/features/course/domain/entity/course_entity.dart';
import 'package:studyflix/features/course/domain/repository/course_repository.dart';

import '../../../../core/error/failure.dart';

class CourseLocalRepository implements ICourseRepository {
  final CourseLocalDataSource _courseLocalDataSource;

  CourseLocalRepository({
    required CourseLocalDataSource courseLocalDataSource,
  }) : _courseLocalDataSource = courseLocalDataSource;

  @override
  Future<Either<Failure, List<CourseEntity>>> getAllCourses() async {
    try {
      final courses = await _courseLocalDataSource.getAllCourses();
      return Right(courses);
    } catch (e) {
      return Left(
          LocalDatabaseFailure(message: 'Error fetching all courses: $e'));
    }
  }

  @override
  Future<Either<Failure, CourseEntity>> getCourseById(String courseId) async {
    try {
      final course = await _courseLocalDataSource.getCourseById(courseId);
      return Right(course);
    } catch (e) {
      return Left(
          LocalDatabaseFailure(message: 'Error fetching course by ID: $e'));
    }
  }

  @override
  Future<Either<Failure, List<CourseEntity>>> getCoursesByCategory(
      String categoryId) async {
    try {
      final courses =
          await _courseLocalDataSource.getCoursesByCategory(categoryId);
      if (courses.isEmpty) {
        // Handle the case where no courses are found for the given category ID.
        // Depending on your requirements, you might want to return a failure or simply an empty list.
        return const Left(LocalDatabaseFailure(
            message: 'No courses found for the given category.'));
      }
      return Right(courses);
    } catch (e) {
      return Left(LocalDatabaseFailure(
          message: 'Error fetching courses by Category: $e'));
    }
  }
}
