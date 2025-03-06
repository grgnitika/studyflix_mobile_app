import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../../../app/constants/hive_table_constant.dart';
import '../../domain/entity/category_entity.dart';

part 'category_hive_model.g.dart';

// Command to Generate Adapter: dart run build_runner build -d
// Need to run each time changes are made to the model.

@HiveType(typeId: HiveTableConstant.categoryTableId)
class CategoryHiveModel extends Equatable {
  @HiveField(0)
  final String? id;

  @HiveField(1)
  final String name;

  CategoryHiveModel({
    String? id,
    required this.name,
  }) : id = id ?? const Uuid().v4();

  // Initial Constructor
  const CategoryHiveModel.initial()
      : id = '',
        name = '';

  // From Entity
  factory CategoryHiveModel.fromEntity(CategoryEntity entity) {
    return CategoryHiveModel(
      id: entity.id,
      name: entity.name,
    );
  }

  // To Entity
  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id,
      name: name,
    );
  }

  // To Entity List
  static List<CategoryHiveModel> fromEntityList(
      List<CategoryEntity> entityList) {
    return entityList
        .map((entity) => CategoryHiveModel.fromEntity(entity))
        .toList();
  }

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
