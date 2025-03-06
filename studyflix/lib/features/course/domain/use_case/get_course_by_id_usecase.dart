import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:studyflix/features/course/domain/entity/course_entity.dart';
import 'package:studyflix/features/course/domain/repository/course_repository.dart';

import '../../../../app/usecase/usecase.dart';
import '../../../../core/error/failure.dart';

class GetCourseByIdParams extends Equatable {
  final String courseId;

  const GetCourseByIdParams({required this.courseId});

  @override
  List<Object?> get props => [courseId];
}

class GetCourseByIdUseCase
    implements UsecaseWithParams<CourseEntity, GetCourseByIdParams> {
  final ICourseRepository courseRepository;

  GetCourseByIdUseCase({required this.courseRepository});

  @override
  Future<Either<Failure, CourseEntity>> call(GetCourseByIdParams params) async {
    return courseRepository.getCourseById(params.courseId);
  }
}
