import 'package:dartz/dartz.dart';
import 'package:bende/core/error/failures.dart';
import 'package:bende/core/error/exceptions.dart';
import 'package:bende/features/courses/data/datasources/course_remote_data_source.dart';
import 'package:bende/features/courses/domain/entities/course.dart';
import 'package:bende/features/courses/domain/entities/topic.dart';
import 'package:bende/features/courses/domain/repositories/course_repository.dart';

class CourseRepositoryImpl implements CourseRepository {
  final CourseRemoteDataSource remoteDataSource;

  CourseRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Course>>> getCourses() async {
    try {
      final courses = await remoteDataSource.getCourses();
      return Right(courses);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, Course>> getCourseById(String id) async {
    try {
      final course = await remoteDataSource.getCourseById(id);
      return Right(course);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Subject>>> getSubjectsForCourse(
      String courseId) async {
    try {
      final subjects = await remoteDataSource.getSubjectsForCourse(courseId);
      return Right(subjects);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Topic>>> getTopicsForSubject(
      String subjectId) async {
    try {
      final topics = await remoteDataSource.getTopicsForSubject(subjectId);
      return Right(topics);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    }
  }
}
