import 'package:equatable/equatable.dart';

import '../../domain/entity/category_entity.dart';

class CategoryState extends Equatable {
  final List<CategoryEntity> categories;
  final bool isLoading;
  final String? error;

  const CategoryState({
    required this.categories,
    required this.isLoading,
    this.error,
  });

  factory CategoryState.initial() {
    return const CategoryState(
      categories: [],
      isLoading: false,
    );
  }

  CategoryState copyWith({
    List<CategoryEntity>? categories,
    bool? isLoading,
    String? error,
  }) {
    return CategoryState(
      categories: categories ?? this.categories,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        categories,
        isLoading,
        error,
      ];
}
