import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:studyflix/app/constants/hive_table_constant.dart';
import 'package:studyflix/features/auth/domain/entity/auth_entity.dart';
import 'package:uuid/uuid.dart';

part 'auth_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.userTableId)
class AuthHiveModel extends Equatable {
  @HiveField(0)
  final String? userId;
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final String username;
  @HiveField(3)
  final String email;
  @HiveField(4)
  final String password;
  @HiveField(5)
  final String role; // Add role field

  AuthHiveModel({
    String? userId,
    this.image,
    required this.username,
    required this.email,
    required this.password,
    required this.role, // Add role field
  }) : userId = userId ?? const Uuid().v4();

  // Initial Constructor
  const AuthHiveModel.initial()
      : userId = '',
        image = '',
        username = '',
        email = '',
        password = '',
        role = ''; // Add role field

  // From Entity
  factory AuthHiveModel.fromEntity(AuthEntity entity) {
    return AuthHiveModel(
      userId: entity.userId,
      image: entity.image,
      username: entity.username,
      email: entity.email,
      password: entity.password,
      role: entity.role, // Add role field
    );
  }

  // To Entity
  AuthEntity toEntity() {
    return AuthEntity(
      userId: userId,
      image: image,
      username: username,
      email: email,
      password: password,
      role: role, // Add role field
    );
  }

  @override
  List<Object?> get props => [userId, image, username, email, password, role];
}
