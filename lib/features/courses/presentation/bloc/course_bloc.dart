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
}
