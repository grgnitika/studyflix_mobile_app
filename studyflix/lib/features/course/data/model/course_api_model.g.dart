// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseApiModel _$CourseApiModelFromJson(Map<String, dynamic> json) =>
    CourseApiModel(
      id: json['_id'] as String?,
      title: json['title'] as String,
      category: json['category'] as String,
      level: json['level'] as String,
      primaryLanguage: json['primaryLanguage'] as String,
      subtitle: json['subtitle'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      welcomeMessage: json['welcomeMessage'] as String,
      objectives: json['objectives'] as String,
      students: (json['students'] as List<dynamic>)
          .map((e) => StudentApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      curriculum: (json['curriculum'] as List<dynamic>)
          .map((e) => LectureApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isPublished: json['isPublished'] as bool,
    );

Map<String, dynamic> _$CourseApiModelToJson(CourseApiModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'category': instance.category,
      'level': instance.level,
      'primaryLanguage': instance.primaryLanguage,
      'subtitle': instance.subtitle,
      'description': instance.description,
      'image': instance.image,
      'welcomeMessage': instance.welcomeMessage,
      'objectives': instance.objectives,
      'students': instance.students,
      'curriculum': instance.curriculum,
      'isPublished': instance.isPublished,
    };

LectureApiModel _$LectureApiModelFromJson(Map<String, dynamic> json) =>
    LectureApiModel(
      title: json['title'] as String,
      videoUrl: json['videoUrl'] as String,
      publicId: json['public_id'] as String,
      freePreview: json['free_preview'] as bool,
    );

Map<String, dynamic> _$LectureApiModelToJson(LectureApiModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'videoUrl': instance.videoUrl,
      'public_id': instance.publicId,
      'free_preview': instance.freePreview,
    };

StudentApiModel _$StudentApiModelFromJson(Map<String, dynamic> json) =>
    StudentApiModel(
      studentId: json['studentId'] as String,
      studentName: json['studentName'] as String,
      studentEmail: json['studentEmail'] as String,
    );

Map<String, dynamic> _$StudentApiModelToJson(StudentApiModel instance) =>
    <String, dynamic>{
      'studentId': instance.studentId,
      'studentName': instance.studentName,
      'studentEmail': instance.studentEmail,
    };
