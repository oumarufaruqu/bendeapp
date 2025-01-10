import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bende/features/courses/domain/entities/course.dart';
import 'package:bende/features/courses/domain/repositories/course_repository.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final CourseRepository repository;

  CourseBloc({required this.repository}) : super(CourseInitial()) {
    on<LoadCourses>(_onLoadCourses);
    on<LoadCourseDetails>(_onLoadCourseDetails);
  }

  Future<void> _onLoadCourses(
    LoadCourses event,
    Emitter<CourseState> emit,
  ) async {
    emit(CourseLoading());

    final result = await repository.getCourses();

    result.fold(
      (failure) => emit(CourseError(failure.message)),
      (courses) => emit(CoursesLoaded(courses)),
    );
  }

  Future<void> _onLoadCourseDetails(
    LoadCourseDetails event,
    Emitter<CourseState> emit,
  ) async {
    emit(CourseLoading());

    final result = await repository.getCourseById(event.courseId);

    result.fold(
      (failure) => emit(CourseError(failure.message)),
      (course) => emit(CourseDetailsLoaded(course)),
    );
  }
}
