part of 'course_card_bloc.dart';

sealed class CourseCardEvent extends Equatable {
  const CourseCardEvent();

  @override
  List<Object?> get props => [];
}

final class LoadCourses extends CourseCardEvent {}
