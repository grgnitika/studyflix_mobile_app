// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthApiModel _$AuthApiModelFromJson(Map<String, dynamic> json) => AuthApiModel(
      id: json['_id'] as String?,
      image: json['image'] as String?,
      username: json['username'] as String,
      email: json['email'] as String,
      password: json['password'] as String?,
      role: json['role'] as String,
    );

Map<String, dynamic> _$AuthApiModelToJson(AuthApiModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'image': instance.image,
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
      'role': instance.role,
    };
