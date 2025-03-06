import 'package:dio/dio.dart';
import 'package:studyflix/features/course/data/model/course_api_model.dart';
import 'package:studyflix/features/course/domain/entity/course_entity.dart';

import '../../../../../app/constants/api_endpoints.dart';

class CourseRemoteDataSource {
  final Dio _dio;

  CourseRemoteDataSource(this._dio);

  Future<List<CourseEntity>> getAllCourses() async {
    try {
      var response = await _dio.get(ApiEndpoints.getAllCourses);
      if (response.statusCode == 200) {
        var data = response.data as List<dynamic>;
        return data
            .map((course) => CourseApiModel.fromJson(course).toEntity())
            .toList();
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<CourseEntity> getCourseById(String courseId) async {
    try {
      var response = await _dio.get('${ApiEndpoints.getCourseById}/$courseId');
      if (response.statusCode == 200) {
        return CourseApiModel.fromJson(response.data).toEntity();
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<CourseEntity>> getCoursesByCategory(String categoryId) async {
    try {
      // Assuming the endpoint is in the format /api/courses?category=XYZ
      var response = await _dio.get(
        ApiEndpoints.getCoursesByCategory,
        queryParameters: {'category': categoryId},
      );

      if (response.statusCode == 200) {
        var data = response.data as List<dynamic>;
        return data
            .map((courseJson) => CourseApiModel.fromJson(courseJson).toEntity())
            .toList();
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      // You might want to handle DioExceptions differently, e.g., no internet connection
      throw Exception(e.message);
    } catch (e) {
      // Handle other exceptions
      throw Exception(e.toString());
    }
  }
}
