import 'package:dartz/dartz.dart';
import 'package:studyflix/features/course/data/data_source/remote_datasource/course_remote_datasource.dart';
import 'package:studyflix/features/course/domain/entity/course_entity.dart';
import 'package:studyflix/features/course/domain/repository/course_repository.dart';

import '../../../../core/error/failure.dart';

class CourseRemoteRepository implements ICourseRepository {
  final CourseRemoteDataSource _courseRemoteDataSource;

  CourseRemoteRepository({
    required CourseRemoteDataSource courseRemoteDataSource,
  }) : _courseRemoteDataSource = courseRemoteDataSource;

  @override
  Future<Either<Failure, List<CourseEntity>>> getAllCourses() async {
    try {
      final courses = await _courseRemoteDataSource.getAllCourses();
      return Right(courses);
    } catch (e) {
      return Left(ApiFailure(message: 'Error fetching all courses: $e'));
    }
  }

  @override
  Future<Either<Failure, CourseEntity>> getCourseById(String courseId) async {
    try {
      final course = await _courseRemoteDataSource.getCourseById(courseId);
      return Right(course);
    } catch (e) {
      return Left(ApiFailure(message: 'Error fetching course by ID: $e'));
    }
  }

  @override
  Future<Either<Failure, List<CourseEntity>>> getCoursesByCategory(
      String categoryId) async {
    try {
      final courses =
          await _courseRemoteDataSource.getCoursesByCategory(categoryId);
      // Assuming that an empty list is a valid response when no courses are found for the given category ID.
      // If you prefer to treat an empty list as an error condition, you can return a Left with a Failure.
      return Right(courses);
    } catch (e) {
      // Return a failure with a message including the exception details.
      return Left(
          ApiFailure(message: 'Error fetching courses by Category: $e'));
    }
  }
}
