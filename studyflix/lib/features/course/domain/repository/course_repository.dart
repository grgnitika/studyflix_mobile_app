import 'package:dartz/dartz.dart';
import 'package:studyflix/features/course/domain/entity/course_entity.dart';

import '../../../../core/error/failure.dart';

abstract interface class ICourseRepository {
  Future<Either<Failure, List<CourseEntity>>> getAllCourses();

  Future<Either<Failure, CourseEntity>> getCourseById(String courseId);

  Future<Either<Failure, List<CourseEntity>>> getCoursesByCategory(
      String categoryId);
}
