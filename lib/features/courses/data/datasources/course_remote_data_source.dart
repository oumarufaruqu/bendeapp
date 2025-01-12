import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:bende/core/error/exceptions.dart';
import 'package:bende/features/courses/data/models/course_model.dart';

abstract class CourseRemoteDataSource {
  Future<List<CourseModel>> getCourses();
}

class CourseRemoteDataSourceImpl implements CourseRemoteDataSource {
  final SupabaseClient supabase;

  CourseRemoteDataSourceImpl(this.supabase);

  @override
  Future<List<CourseModel>> getCourses() async {
    try {
      final response = await supabase.from('courses').select();

      final List<dynamic> data = response;
      return data.map((json) => CourseModel.fromJson(json)).toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw NetworkException('Failed to fetch courses: $e');
    }
  }
}
