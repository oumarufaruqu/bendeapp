import 'package:dartz/dartz.dart';
import 'package:bende/core/error/failures.dart';
import 'package:bende/features/courses/domain/entities/course.dart';

abstract class CourseRepository {
  Future<Either<Failure, List<Course>>> getCourses();
}
