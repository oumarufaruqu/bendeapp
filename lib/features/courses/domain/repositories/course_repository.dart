import 'package:dartz/dartz.dart';
import 'package:bende/core/error/failures.dart';
import 'package:bende/features/courses/domain/entities/course.dart';
import 'package:bende/features/courses/domain/entities/topic.dart';

abstract class CourseRepository {
  Future<Either<Failure, List<Course>>> getCourses();
  Future<Either<Failure, Course>> getCourseById(String id);
  Future<Either<Failure, List<Subject>>> getSubjectsForCourse(String courseId);
  Future<Either<Failure, List<Topic>>> getTopicsForSubject(String subjectId);
}
