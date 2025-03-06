import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entity/category_entity.dart';
import '../../domain/repository/category_repository.dart';
import '../data_source/remote_datasource/category_remote_data_source.dart';

class CategoryRemoteRepository implements ICategoryRepository {
  final CategoryRemoteDataSource _categoryRemoteDataSource;

  CategoryRemoteRepository({
    required CategoryRemoteDataSource categoryRemoteDataSource,
  }) : _categoryRemoteDataSource = categoryRemoteDataSource;

  @override
  Future<Either<Failure, void>> createCategory(CategoryEntity category) async {
    try {
      await _categoryRemoteDataSource.createCategory(category);
      return const Right(null);
    } catch (e) {
      return Left(ApiFailure(message: 'Error creating category: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteCategory(String id, String? token) async {
    try {
      await _categoryRemoteDataSource.deleteCategory(id, token);
      return const Right(null);
    } catch (e) {
      return Left(ApiFailure(message: 'Error deleting category: $e'));
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories() async {
    try {
      final categories = await _categoryRemoteDataSource.getAllCategories();
      return Right(categories);
    } catch (e) {
      return Left(ApiFailure(message: 'Error fetching all categories: $e'));
    }
  }

  @override
  Future<Either<Failure, CategoryEntity>> getCategoryById(String id) async {
    try {
      final category = await _categoryRemoteDataSource.getCategoryById(id);
      return Right(category);
    } catch (e) {
      return Left(ApiFailure(message: 'Error fetching category by ID: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> updateCategory(
      CategoryEntity category, String? token) async {
    try {
      await _categoryRemoteDataSource.updateCategory(category);
      return const Right(null);
    } catch (e) {
      return Left(ApiFailure(message: 'Error updating category: $e'));
    }
  }
}
