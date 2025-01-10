import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:bende/core/config/supabase_config.dart';
import 'package:bende/core/error/exceptions.dart';
import 'package:bende/features/courses/data/models/course_model.dart';
import 'package:bende/features/courses/data/models/topic_model.dart';

abstract class CourseRemoteDataSource {
  Future<List<CourseModel>> getCourses();
  Future<CourseModel> getCourseById(String id);
  Future<List<SubjectModel>> getSubjectsForCourse(String courseId);
  Future<List<TopicModel>> getTopicsForSubject(String subjectId);
}

class CourseRemoteDataSourceImpl implements CourseRemoteDataSource {
  final SupabaseClient supabase;

  CourseRemoteDataSourceImpl(this.supabase);

  @override
  Future<List<CourseModel>> getCourses() async {
    try {
      final response = await supabase.from(SupabaseConfig.coursesTable).select(
          '*, subjects:${SupabaseConfig.subjectsTable}(*, topics:${SupabaseConfig.topicsTable}(*))');

      final List<dynamic> data = response;
      return data.map((json) => CourseModel.fromJson(json)).toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw NetworkException('Failed to fetch courses: $e');
    }
  }

  @override
  Future<CourseModel> getCourseById(String id) async {
    try {
      final response = await supabase
          .from(SupabaseConfig.coursesTable)
          .select(
              '*, subjects:${SupabaseConfig.subjectsTable}(*, topics:${SupabaseConfig.topicsTable}(*))')
          .eq('id', id)
          .single();

      return CourseModel.fromJson(response);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw NetworkException('Failed to fetch course: $e');
    }
  }

  @override
  Future<List<SubjectModel>> getSubjectsForCourse(String courseId) async {
    final response = await supabase
        .from(SupabaseConfig.subjectsTable)
        .select('*, topics:${SupabaseConfig.topicsTable}(*)')
        .eq('course_id', courseId);

    final List<dynamic> data = response;
    return data.map((json) => SubjectModel.fromJson(json)).toList();
  }

  @override
  Future<List<TopicModel>> getTopicsForSubject(String subjectId) async {
    final response = await supabase
        .from(SupabaseConfig.topicsTable)
        .select()
        .eq('subject_id', subjectId);

    final List<dynamic> data = response;
    return data.map((json) => TopicModel.fromJson(json)).toList();
  }
}
