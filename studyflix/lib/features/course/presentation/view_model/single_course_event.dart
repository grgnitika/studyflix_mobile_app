part of 'single_course_bloc.dart';

abstract class SingleCourseEvent extends Equatable {
  const SingleCourseEvent();

  @override
  List<Object> get props => [];
}

class LoadSingleCourse extends SingleCourseEvent {
  final String courseId;

  const LoadSingleCourse({required this.courseId});

  @override
  List<Object> get props => [courseId];
}
