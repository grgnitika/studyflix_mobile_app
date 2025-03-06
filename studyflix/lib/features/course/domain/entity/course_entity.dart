import 'package:equatable/equatable.dart';

class LectureEntity extends Equatable {
  final String title;
  final String videoUrl;
  final String publicId;
  final bool freePreview;

  const LectureEntity({
    required this.title,
    required this.videoUrl,
    required this.publicId,
    required this.freePreview,
  });

  @override
  List<Object?> get props => [title, videoUrl, publicId, freePreview];
}

class CourseEntity extends Equatable {
  final String? id;
  final String title;
  final String category;
  final String level;
  final String primaryLanguage;
  final String subtitle;
  final String description;
  final String image;
  final String welcomeMessage;
  final String objectives;
  final List<StudentEntity> students;
  final List<LectureEntity> curriculum;
  final bool isPublished;

  const CourseEntity({
    this.id,
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
  });

  // Empty Constructor with default values
  factory CourseEntity.empty() {
    return const CourseEntity(
      id: '_empty.id',
      title: '_empty.title',
      category: '_empty.category',
      level: '_empty.level',
      primaryLanguage: '_empty.primaryLanguage',
      subtitle: '_empty.subtitle',
      description: '_empty.description',
      image: '_empty.image',
      welcomeMessage: '_empty.welcomeMessage',
      objectives: '_empty.objectives',
      students: [],
      curriculum: [],
      isPublished: false,
    );
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
}

class StudentEntity extends Equatable {
  final String studentId;
  final String studentName;
  final String studentEmail;

  const StudentEntity({
    required this.studentId,
    required this.studentName,
    required this.studentEmail,
  });

  @override
  List<Object?> get props => [studentId, studentName, studentEmail];
}
