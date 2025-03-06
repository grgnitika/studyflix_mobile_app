import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entity/category_entity.dart';
import '../../domain/repository/category_repository.dart';
import '../data_source/local_datasource/category_local_data_source.dart';

class CategoryLocalRepository implements ICategoryRepository {
  final CategoryLocalDataSource _categoryLocalDataSource;

  CategoryLocalRepository({
    required CategoryLocalDataSource categoryLocalDataSource,
  }) : _categoryLocalDataSource = categoryLocalDataSource;

  @override
  Future<Either<Failure, void>> createCategory(CategoryEntity category) async {
    try {
      await _categoryLocalDataSource.createCategory(category);
      return const Right(null);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: 'Error creating category: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteCategory(String id, String? token) async {
    try {
      await _categoryLocalDataSource.deleteCategory(id, token);
      return const Right(null);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: 'Error deleting category: $e'));
    }
  }

  @override
  Future<Either<Failure, CategoryEntity>> getCategoryById(String id) async {
    try {
      final category = await _categoryLocalDataSource.getCategoryById(id);
      return Right(category);
    } catch (e) {
      return Left(
          LocalDatabaseFailure(message: 'Error fetching category by ID: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> updateCategory(
      CategoryEntity category, String? token) async {
    try {
      await _categoryLocalDataSource.updateCategory(category);
      return const Right(null);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: 'Error updating category: $e'));
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories() async {
    try {
      final categories = await _categoryLocalDataSource.getAllCategories();
      return Right(categories);
    } catch (e) {
      return Left(
          LocalDatabaseFailure(message: 'Error fetching all categories: $e'));
    }
  }
}
