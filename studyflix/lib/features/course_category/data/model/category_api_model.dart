import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/category_entity.dart';

part 'category_api_model.g.dart'; // Include the generated part file.

@JsonSerializable()
class CategoryApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final String name;

  const CategoryApiModel({
    this.id,
    required this.name,
  });

  const CategoryApiModel.empty()
      : id = '',
        name = '';

  // From JSON
  factory CategoryApiModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryApiModelFromJson(json);

  // To JSON
  Map<String, dynamic> toJson() => _$CategoryApiModelToJson(this);

  // Convert API Object to Entity
  CategoryEntity toEntity() => CategoryEntity(
        id: id,
        name: name,
      );

  // Convert Entity to API Object
  factory CategoryApiModel.fromEntity(CategoryEntity category) {
    return CategoryApiModel(
      id: category.id,
      name: category.name,
    );
  }

  // Convert API List to Entity List
  static List<CategoryEntity> toEntityList(List<CategoryApiModel> models) {
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
