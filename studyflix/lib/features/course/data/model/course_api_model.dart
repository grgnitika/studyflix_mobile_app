import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:studyflix/features/course/domain/entity/course_entity.dart';

part 'course_api_model.g.dart'; // Include the generated part file.

@JsonSerializable()
class CourseApiModel extends Equatable {
  @JsonKey(name: '_id')
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
  final List<StudentApiModel> students;
  final List<LectureApiModel> curriculum;
  final bool isPublished;

  const CourseApiModel({
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

  const CourseApiModel.empty()
      : id = '_empty.id',
        title = '_empty.title',
        category = '_empty.category',
        level = '_empty.level',
        primaryLanguage = '_empty.primaryLanguage',
        subtitle = '_empty.subtitle',
        description = '_empty.description',
        image = '_empty.image',
        welcomeMessage = '_empty.welcomeMessage',
        objectives = '_empty.objectives',
        students = const [],
        curriculum = const [],
        isPublished = false;

  // From JSON
  factory CourseApiModel.fromJson(Map<String, dynamic> json) =>
      _$CourseApiModelFromJson(json);

  // To JSON
  Map<String, dynamic> toJson() => _$CourseApiModelToJson(this);

  // Convert API Object to Entity
  CourseEntity toEntity() => CourseEntity(
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

  // Convert Entity to API Object
  factory CourseApiModel.fromEntity(CourseEntity course) {
    return CourseApiModel(
      id: course.id,
      title: course.title,
      category: course.category,
      level: course.level,
      primaryLanguage: course.primaryLanguage,
      subtitle: course.subtitle,
      description: course.description,
      image: course.image,
      welcomeMessage: course.welcomeMessage,
      objectives: course.objectives,
      students: course.students
          .map((student) => StudentApiModel.fromEntity(student))
          .toList(),
      curriculum: course.curriculum
          .map((lecture) => LectureApiModel.fromEntity(lecture))
          .toList(),
      isPublished: course.isPublished,
    );
  }

  // Convert API List to Entity List
  static List<CourseEntity> toEntityList(List<CourseApiModel> models) {
    return models.map((model) => model.toEntity()).toList();
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

@JsonSerializable()
class LectureApiModel extends Equatable {
  final String title;
  final String videoUrl;
  @JsonKey(name: 'public_id')
  final String publicId;
  @JsonKey(name: 'free_preview')
  final bool freePreview;

  const LectureApiModel({
    required this.title,
    required this.videoUrl,
    required this.publicId,
    required this.freePreview,
  });

  const LectureApiModel.empty()
      : title = '_empty.title',
        videoUrl = '_empty.videoUrl',
        publicId = '_empty.publicId',
        freePreview = false;

  // From JSON
  factory LectureApiModel.fromJson(Map<String, dynamic> json) =>
      _$LectureApiModelFromJson(json);

  // To JSON
  Map<String, dynamic> toJson() => _$LectureApiModelToJson(this);

  // Convert API Object to Entity
  LectureEntity toEntity() => LectureEntity(
        title: title,
        videoUrl: videoUrl,
        publicId: publicId,
        freePreview: freePreview,
      );

  // Convert Entity to API Object
  factory LectureApiModel.fromEntity(LectureEntity lecture) {
    return LectureApiModel(
      title: lecture.title,
      videoUrl: lecture.videoUrl,
      publicId: lecture.publicId,
      freePreview: lecture.freePreview,
    );
  }

  @override
  List<Object?> get props => [title, videoUrl, publicId, freePreview];
}

@JsonSerializable()
class StudentApiModel extends Equatable {
  final String studentId;
  final String studentName;
  final String studentEmail;

  const StudentApiModel({
    required this.studentId,
    required this.studentName,
    required this.studentEmail,
  });

  const StudentApiModel.empty()
      : studentId = '_empty.studentId',
        studentName = '_empty.studentName',
        studentEmail = '_empty.studentEmail';

  // From JSON
  factory StudentApiModel.fromJson(Map<String, dynamic> json) =>
      _$StudentApiModelFromJson(json);

  // To JSON
  Map<String, dynamic> toJson() => _$StudentApiModelToJson(this);

  // Convert API Object to Entity
  StudentEntity toEntity() => StudentEntity(
        studentId: studentId,
        studentName: studentName,
        studentEmail: studentEmail,
      );

  // Convert Entity to API Object
  factory StudentApiModel.fromEntity(StudentEntity student) {
    return StudentApiModel(
      studentId: student.studentId,
      studentName: student.studentName,
      studentEmail: student.studentEmail,
    );
  }

  @override
  List<Object?> get props => [studentId, studentName, studentEmail];
}
