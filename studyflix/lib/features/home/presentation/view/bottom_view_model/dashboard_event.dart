import 'package:equatable/equatable.dart';

abstract class DashboardEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// Event to load initial data
class LoadDashboardData extends DashboardEvent {}

// Event to filter workshops by multiple categories
class FilterCourses extends DashboardEvent {
  final List<String> selectedCategories;

  FilterCourses(this.selectedCategories);

  @override
  List<Object?> get props => [selectedCategories];
}
