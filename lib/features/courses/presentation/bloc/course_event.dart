part of 'course_bloc.dart';

abstract class CourseEvent extends Equatable {
  const CourseEvent();

  @override
  List<Object> get props => [];
}

class LoadCourses extends CourseEvent {}

class LoadCourseDetails extends CourseEvent {
  final String courseId;

  const LoadCourseDetails(this.courseId);

  @override
  List<Object> get props => [courseId];
}
