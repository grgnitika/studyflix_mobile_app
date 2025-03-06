part of 'single_course_bloc.dart';

abstract class SingleCourseState extends Equatable {
  const SingleCourseState();

  @override
  List<Object> get props => [];
}

class SingleCourseInitial extends SingleCourseState {}

class SingleCourseLoading extends SingleCourseState {}

class SingleCourseLoaded extends SingleCourseState {
  final CourseEntity course;

  const SingleCourseLoaded({required this.course});

  @override
  List<Object> get props => [course];
}

class SingleCourseError extends SingleCourseState {
  final String message;

  const SingleCourseError({required this.message});

  @override
  List<Object> get props => [message];
}
