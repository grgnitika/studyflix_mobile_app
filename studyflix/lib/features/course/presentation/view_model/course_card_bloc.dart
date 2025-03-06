import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:studyflix/features/course/domain/use_case/get_all_courses_usecase.dart';

import '../../domain/entity/course_entity.dart';

part 'course_card_event.dart';
part 'course_card_state.dart';

class CourseCardBloc extends Bloc<CourseCardEvent, CourseCardState> {
  final GetAllCoursesUseCase _getAllCoursesUseCase;

  CourseCardBloc({
    required GetAllCoursesUseCase getAllCoursesUseCase,
  })  : _getAllCoursesUseCase = getAllCoursesUseCase,
        super(CourseCardState.initial()) {
    on<LoadCourses>(_onLoadCourses);

    // Trigger initial loading
    add(LoadCourses());
  }

  Future<void> _onLoadCourses(
      LoadCourses event, Emitter<CourseCardState> emit) async {
    emit(state.copyWith(isLoading: true, courses: []));
    final result = await _getAllCoursesUseCase.call();
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (courses) => emit(state.copyWith(
        isLoading: false,
        error: null,
        courses: courses,
      )),
    );
  }
}
