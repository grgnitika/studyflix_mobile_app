import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final String? id;
  final String name;

  const CategoryEntity({
    this.id,
    required this.name,
  });

  // Initialize Empty Constructor
  const CategoryEntity.empty()
      : id = '_empty.id',
        name = '_empty.name';

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
