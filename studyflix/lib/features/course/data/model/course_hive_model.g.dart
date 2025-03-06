// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CourseHiveModelAdapter extends TypeAdapter<CourseHiveModel> {
  @override
  final int typeId = 1;

  @override
  CourseHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CourseHiveModel(
      id: fields[0] as String?,
      title: fields[1] as String,
      category: fields[2] as String,
      level: fields[3] as String,
      primaryLanguage: fields[4] as String,
      subtitle: fields[5] as String,
      description: fields[6] as String,
      image: fields[7] as String,
      welcomeMessage: fields[8] as String,
      objectives: fields[9] as String,
      students: (fields[10] as List).cast<StudentHiveModel>(),
      curriculum: (fields[11] as List).cast<LectureHiveModel>(),
      isPublished: fields[12] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, CourseHiveModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.level)
      ..writeByte(4)
      ..write(obj.primaryLanguage)
      ..writeByte(5)
      ..write(obj.subtitle)
      ..writeByte(6)
      ..write(obj.description)
      ..writeByte(7)
      ..write(obj.image)
      ..writeByte(8)
      ..write(obj.welcomeMessage)
      ..writeByte(9)
      ..write(obj.objectives)
      ..writeByte(10)
      ..write(obj.students)
      ..writeByte(11)
      ..write(obj.curriculum)
      ..writeByte(12)
      ..write(obj.isPublished);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CourseHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LectureHiveModelAdapter extends TypeAdapter<LectureHiveModel> {
  @override
  final int typeId = 3;

  @override
  LectureHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LectureHiveModel(
      title: fields[0] as String,
      videoUrl: fields[1] as String,
      publicId: fields[2] as String,
      freePreview: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, LectureHiveModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.videoUrl)
      ..writeByte(2)
      ..write(obj.publicId)
      ..writeByte(3)
      ..write(obj.freePreview);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LectureHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class StudentHiveModelAdapter extends TypeAdapter<StudentHiveModel> {
  @override
  final int typeId = 0;

  @override
  StudentHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudentHiveModel(
      userId: fields[0] as String,
      username: fields[1] as String,
      email: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, StudentHiveModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.email);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
