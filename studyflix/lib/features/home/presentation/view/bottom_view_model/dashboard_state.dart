import 'package:equatable/equatable.dart';

abstract class DashboardState extends Equatable {
  @override
  List<Object?> get props => [];
}

// Initial state
class DashboardInitial extends DashboardState {}

// Loading state
class DashboardLoading extends DashboardState {}

// Loaded state with workshops
class DashboardLoaded extends DashboardState {
  final List<String> categories;
  final List<Map<String, dynamic>> courses;

  DashboardLoaded({required this.categories, required this.courses});

  @override
  List<Object?> get props => [categories, courses];
}

// Error state
class DashboardError extends DashboardState {
  final String message;

  DashboardError(this.message);

  @override
  List<Object?> get props => [message];
}
