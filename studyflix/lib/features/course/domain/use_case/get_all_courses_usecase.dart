import 'package:dartz/dartz.dart';
import 'package:studyflix/features/course/domain/entity/course_entity.dart';
import 'package:studyflix/features/course/domain/repository/course_repository.dart';

import '../../../../app/usecase/usecase.dart';
import '../../../../core/error/failure.dart';

class GetAllCoursesUseCase implements UsecaseWithoutParams<List<CourseEntity>> {
  final ICourseRepository courseRepository;

  GetAllCoursesUseCase({required this.courseRepository});

  @override
  Future<Either<Failure, List<CourseEntity>>> call() {
    return courseRepository.getAllCourses();
  }
}
