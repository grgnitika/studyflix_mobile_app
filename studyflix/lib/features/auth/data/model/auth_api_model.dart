import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:studyflix/features/auth/domain/entity/auth_entity.dart';

part 'auth_api_model.g.dart';

@JsonSerializable()
class AuthApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final String? image;
  final String username;
  final String email;
  final String? password;
  final String role;

  const AuthApiModel({
    this.id,
    required this.image,
    required this.username,
    required this.email,
    required this.password,
    required this.role,
  });

  factory AuthApiModel.fromJson(Map<String, dynamic> json) =>
      _$AuthApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthApiModelToJson(this);

  // To Entity
  AuthEntity toEntity() {
    return AuthEntity(
      userId: id,
      image: image,
      username: username,
      email: email,
      password: password ?? '',
      role: role,
    );
  }

  // From Entity
  factory AuthApiModel.fromEntity(AuthEntity entity) {
    return AuthApiModel(
      image: entity.image,
      username: entity.username,
      email: entity.email,
      password: entity.password,
      role: entity.role,
    );
  }

  @override
  List<Object?> get props => [id, image, username, email, role];
}
