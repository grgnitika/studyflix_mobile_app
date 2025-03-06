part of 'course_card_bloc.dart';

class CourseCardState extends Equatable {
  final List<CourseEntity> courses;
  final bool isLoading;
  final String? error;

  const CourseCardState({
    required this.courses,
    required this.isLoading,
    this.error,
  });

  factory CourseCardState.initial() {
    return const CourseCardState(
      courses: [],
      isLoading: false,
    );
  }

  CourseCardState copyWith({
    List<CourseEntity>? courses,
    bool? isLoading,
    String? error,
  }) {
    return CourseCardState(
      courses: courses ?? this.courses,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  @override
  List<Object?> get props => [courses, isLoading, error];
}
