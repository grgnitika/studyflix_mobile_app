import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:studyflix/app/constants/hive_table_constant.dart';
import 'package:studyflix/features/auth/data/model/auth_hive_model.dart';
import 'package:studyflix/features/course/data/model/course_hive_model.dart';
import 'package:studyflix/features/course_category/data/model/category_hive_model.dart';

class HiveService {
  static Future<void> init() async {
    // Initialize the database
    var directory = await getApplicationDocumentsDirectory();
    var path = '${directory.path}studyflix.db';

    Hive.init(path);

    //Register Adapters
    Hive.registerAdapter(CourseHiveModelAdapter());
  }

  // Auth Queries
  Future<void> register(AuthHiveModel auth) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    await box.put(auth.userId, auth);
  }

  Future<void> deleteAuth(String id) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    await box.delete(id);
  }

  Future<List<AuthHiveModel>> getAllAuth() async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    return box.values.toList();
  }

  // Login using email and password
  Future<AuthHiveModel?> login(String email, String password) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.userBox);
    var user = box.values.firstWhere(
        (element) => element.email == email && element.password == password);
    box.close();
    return user;
  }

  Future<void> clearAll() async {
    await Hive.deleteBoxFromDisk(HiveTableConstant.userBox);
  }

  // Clear Student Box
  Future<void> clearUserBox() async {
    await Hive.deleteBoxFromDisk(HiveTableConstant.userBox);
  }

  Future<void> close() async {
    await Hive.close();
  }

  // Course Queries
  Future<void> addCourse(CourseHiveModel course) async {
    var box = await Hive.openBox<CourseHiveModel>(HiveTableConstant.courseBox);
    await box.put(course.courseId, course);
  }

  Future<void> deleteCourse(String courseId) async {
    var box = await Hive.openBox<CourseHiveModel>(HiveTableConstant.courseBox);
    await box.delete(courseId);
  }

  Future<List<CourseHiveModel>> getAllCourses() async {
    var box = await Hive.openBox<CourseHiveModel>(HiveTableConstant.courseBox);
    return box.values.toList();
  }

  Future<CourseHiveModel?> getCourseById(String courseId) async {
    var box = await Hive.openBox<CourseHiveModel>(HiveTableConstant.courseBox);
    return box.get(courseId);
  }

  Future<void> updateCourse(CourseHiveModel course) async {
    var box = await Hive.openBox<CourseHiveModel>(HiveTableConstant.courseBox);
    await box.put(course.courseId, course);
  }

  getCategories() {}

  addCategory(CategoryHiveModel categoryHiveModel) {}

  deleteCategory(String id) {}

  updateCategory(CategoryHiveModel categoryHiveModel) {}

  getCategoryById(String id) {}

  getAllCategories() {}
}
