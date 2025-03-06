part of 'category_bloc.dart';

sealed class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object?> get props => [];
}

final class LoadCategories extends CategoryEvent {}

final class LoadCategory extends CategoryEvent {}

final class AddCategory extends CategoryEvent {
  final String name;

  const AddCategory({required this.name});

  @override
  List<Object?> get props => [name];
}

final class DeleteCategory extends CategoryEvent {
  final String id;

  const DeleteCategory({required this.id});

  @override
  List<Object?> get props => [id];
}

final class UpdateCategory extends CategoryEvent {
  final String id;
  final String name;

  const UpdateCategory({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];
}
