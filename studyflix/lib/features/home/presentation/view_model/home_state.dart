import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studyflix/app/di/di.dart';
import 'package:studyflix/features/home/presentation/view/bottom_view/dashboard_view.dart';
import 'package:studyflix/features/home/presentation/view/bottom_view_model/dashboard_bloc.dart';

class HomeState extends Equatable {
  final int selectedIndex;
  final List<Widget> views;

  const HomeState({
    required this.selectedIndex,
    required this.views,
  });

  // Initial state with three tabs (Home, Courses, Profile)
  static HomeState initial() {
    return HomeState(
      selectedIndex: 0,
      views: [
        BlocProvider(
          create: (context) => getIt<DashboardBloc>(),
          child: const DashboardView(),
        ),
        // BlocProvider(
        //   create: (context) => getIt<CoursesBloc>(),
        //   child: CourseCardView(),
        // ),
        // BlocProvider(
        //   create: (context) => getIt<ProfileBloc>(),
        //   child: ProfileView(),
        // ),
      ],
    );
  }

  HomeState copyWith({
    int? selectedIndex,
    List<Widget>? views,
  }) {
    return HomeState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      views: views ?? this.views,
    );
  }

  @override
  List<Object?> get props => [selectedIndex, views];
}
