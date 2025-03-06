import 'package:dartz/dartz.dart'; // Import for Either
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studyflix/core/error/failure.dart'; // Import for Failure
import 'package:studyflix/features/course/domain/entity/course_entity.dart';
import 'package:studyflix/features/course/domain/repository/course_repository.dart';

part 'single_course_event.dart';
part 'single_course_state.dart';

class SingleCourseBloc extends Bloc<SingleCourseEvent, SingleCourseState> {
  final ICourseRepository courseRepository;

  SingleCourseBloc({required this.courseRepository})
      : super(SingleCourseInitial()) {
    on<LoadSingleCourse>((event, emit) async {
      emit(SingleCourseLoading());
      try {
        // Get the result from the repository
        final Either<Failure, CourseEntity> result =
            await courseRepository.getCourseById(event.courseId);

        // Handle the result using fold
        result.fold(
          (failure) => emit(
              SingleCourseError(message: failure.toString())), // Handle failure
          (course) =>
              emit(SingleCourseLoaded(course: course)), // Handle success
        );
      } catch (e) {
        emit(SingleCourseError(message: e.toString()));
      }
    });
  }
}
