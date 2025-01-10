part of 'course_bloc.dart';

abstract class CourseState extends Equatable {
  const CourseState();

  @override
  List<Object> get props => [];
}

class CourseInitial extends CourseState {}

class CourseLoading extends CourseState {}

class CoursesLoaded extends CourseState {
  final List<Course> courses;

  const CoursesLoaded(this.courses);

  @override
  List<Object> get props => [courses];
}

class CourseDetailsLoaded extends CourseState {
  final Course course;

  const CourseDetailsLoaded(this.course);

  @override
  List<Object> get props => [course];
}

class CourseError extends CourseState {
  final String message;

  const CourseError(this.message);

  @override
  List<Object> get props => [message];
}
