class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  static const String baseUrl = "http://10.0.2.2:5000/";
  // For iPhone
  //static const String baseUrl = "http://localhost:3000/api/v1/";

  // ====================== Auth Routes ======================
  static const String login = "auth/login";
  static const String register = "auth/register";
  static const String imageLocationUrl = "http://10.0.2.2:5000";
  static const String getAllStudent = "auth/getAllStudents";
  static const String getStudentsByBatch = "auth/getStudentsByBatch/";
  static const String getStudentsByCourse = "auth/getStudentsByCourse/";
  static const String updateStudent = "auth/updateStudent/";
  static const String deleteStudent = "auth/deleteStudent/";
  static const String imageUrl = "http://10.0.2.2:5000/uploads/";
  static const String uploadImage = "auth/uploads";

  // ====================== Batch Routes ======================
  static const String createBatch = "batch/createBatch";
  static const String getAllBatch = "batch/getAllBatches";
  static const String deleteBatch = "batch/";

  // ============= Course Routes =============
  static const String createCourse = "instructor/add";
  static const String getAllCourses = "courses/get/";
  static const String getCourseById = "courses/";
  static const String updateCourse = "instructor/update/";
  static const String deleteCourse = "courses/delete/";
  static const String getCoursesByCategory = "courses/get/";

  // ============= Category Routes =============
  static const String createCategory = "course-categories/save";
  static const String getAllCategories = "course-categories/";
  static const String getCategoryById = "course-categories/";
  static const String updateCategory = "course-categories/update/";
  static const String deleteCategory = "course-categories/delete/";
}
