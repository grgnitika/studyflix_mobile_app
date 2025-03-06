import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../../../app/constants/hive_table_constant.dart';
import '../../domain/entity/course_entity.dart';

part 'course_hive_model.g.dart'; // Include the generated part file.

// Command to Generate Adapter: dart run build_runner build -d
// Need to run each time changes are made to the model.

@HiveType(typeId: HiveTableConstant.courseTableId)
class CourseHiveModel extends Equatable {
  @HiveField(0)
  final String? id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String category;

  @HiveField(3)
  final String level;

  @HiveField(4)
  final String primaryLanguage;

  @HiveField(5)
  final String subtitle;

  @HiveField(6)
  final String description;

  @HiveField(7)
  final String image;

  @HiveField(8)
  final String welcomeMessage;

  @HiveField(9)
  final String objectives;

  @HiveField(10)
  final List<StudentHiveModel> students;

  @HiveField(11)
  final List<LectureHiveModel> curriculum;

  @HiveField(12)
  final bool isPublished;

  CourseHiveModel({
    String? id,
    required this.title,
    required this.category,
    required this.level,
    required this.primaryLanguage,
    required this.subtitle,
    required this.description,
    required this.image,
    required this.welcomeMessage,
    required this.objectives,
    required this.students,
    required this.curriculum,
    required this.isPublished,
  }) : id = id ?? const Uuid().v4();

  // Initial Constructor
  const CourseHiveModel.initial()
      : id = '',
        title = '',
        category = '',
        level = '',
        primaryLanguage = '',
        subtitle = '',
        description = '',
        image = '',
        welcomeMessage = '',
        objectives = '',
        students = const [],
        curriculum = const [],
        isPublished = false;

  // Empty Constructor
  const CourseHiveModel.empty()
      : id = '',
        title = '',
        category = '',
        level = '',
        primaryLanguage = '',
        subtitle = '',
        description = '',
        image = '',
        welcomeMessage = '',
        objectives = '',
        students = const [],
        curriculum = const [],
        isPublished = false;

  // From Entity
  factory CourseHiveModel.fromEntity(CourseEntity entity) {
    return CourseHiveModel(
      id: entity.id,
      title: entity.title,
      category: entity.category,
      level: entity.level,
      primaryLanguage: entity.primaryLanguage,
      subtitle: entity.subtitle,
      description: entity.description,
      image: entity.image,
      welcomeMessage: entity.welcomeMessage,
      objectives: entity.objectives,
      students: entity.students
          .map((student) => StudentHiveModel.fromEntity(student))
          .toList(),
      curriculum: entity.curriculum
          .map((lecture) => LectureHiveModel.fromEntity(lecture))
          .toList(),
      isPublished: entity.isPublished,
    );
  }

  // To Entity
  CourseEntity toEntity() {
    return CourseEntity(
      id: id,
      title: title,
      category: category,
      level: level,
      primaryLanguage: primaryLanguage,
      subtitle: subtitle,
      description: description,
      image: image,
      welcomeMessage: welcomeMessage,
      objectives: objectives,
      students: students.map((student) => student.toEntity()).toList(),
      curriculum: curriculum.map((lecture) => lecture.toEntity()).toList(),
      isPublished: isPublished,
    );
  }

  // To Entity List
  static List<CourseHiveModel> fromEntityList(List<CourseEntity> entityList) {
    return entityList
        .map((entity) => CourseHiveModel.fromEntity(entity))
        .toList();
  }

  @override
  List<Object?> get props => [
        id,
        title,
        category,
        level,
        primaryLanguage,
        subtitle,
        description,
        image,
        welcomeMessage,
        objectives,
        students,
        curriculum,
        isPublished,
      ];

  get courseId => null;
}

@HiveType(typeId: HiveTableConstant.lectureTableId)
class LectureHiveModel extends Equatable {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String videoUrl;

  @HiveField(2)
  final String publicId;

  @HiveField(3)
  final bool freePreview;

  const LectureHiveModel({
    required this.title,
    required this.videoUrl,
    required this.publicId,
    required this.freePreview,
  });

  // From Entity
  factory LectureHiveModel.fromEntity(LectureEntity entity) {
    return LectureHiveModel(
      title: entity.title,
      videoUrl: entity.videoUrl,
      publicId: entity.publicId,
      freePreview: entity.freePreview,
    );
  }

  // To Entity
  LectureEntity toEntity() {
    return LectureEntity(
      title: title,
      videoUrl: videoUrl,
      publicId: publicId,
      freePreview: freePreview,
    );
  }

  @override
  List<Object?> get props => [title, videoUrl, publicId, freePreview];
}

@HiveType(typeId: HiveTableConstant.userTableId)
class StudentHiveModel extends Equatable {
  @HiveField(0)
  final String userId;

  @HiveField(1)
  final String username;

  @HiveField(2)
  final String email;

  const StudentHiveModel({
    required this.userId,
    required this.username,
    required this.email,
  });

  // From Entity
  factory StudentHiveModel.fromEntity(StudentEntity entity) {
    return StudentHiveModel(
      userId: entity.studentId,
      username: entity.studentName,
      email: entity.studentEmail,
    );
  }

  // To Entity
  StudentEntity toEntity() {
    return StudentEntity(
      studentId: userId,
      studentName: username,
      studentEmail: email,
    );
  }

  @override
  List<Object?> get props => [userId, username, email];
}
