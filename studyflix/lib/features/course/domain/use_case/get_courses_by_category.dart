import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:studyflix/features/course/domain/entity/course_entity.dart';
import 'package:studyflix/features/course/domain/repository/course_repository.dart';

import '../../../../app/usecase/usecase.dart';
import '../../../../core/error/failure.dart';

class GetCoursesByCategoryParams extends Equatable {
  final String categoryId;

  const GetCoursesByCategoryParams({required this.categoryId});

  @override
  List<Object?> get props => [categoryId];
}

class GetCoursesByCategoryUseCase
    implements
        UsecaseWithParams<List<CourseEntity>, GetCoursesByCategoryParams> {
  final ICourseRepository courseRepository;

  GetCoursesByCategoryUseCase({required this.courseRepository});

  @override
  Future<Either<Failure, List<CourseEntity>>> call(
      GetCoursesByCategoryParams params) async {
    return courseRepository.getCoursesByCategory(params.categoryId);
  }
}
