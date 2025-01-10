import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bende/core/theme/app_spacing.dart';
import 'package:bende/core/theme/app_typography.dart';
import 'package:bende/features/courses/presentation/bloc/course_bloc.dart';
import 'package:bende/features/courses/presentation/widgets/course_card.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => context.read<CourseBloc>()..add(LoadCourses()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Dersler',
            style: AppTypography.h2,
          ),
        ),
        body: BlocBuilder<CourseBloc, CourseState>(
          builder: (context, state) {
            if (state is CourseLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is CourseError) {
              return Center(
                child: Text(
                  state.message,
                  style: AppTypography.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              );
            }

            if (state is CoursesLoaded) {
              return ListView.builder(
                padding: const EdgeInsets.all(AppSpacing.md),
                itemCount: state.courses.length,
                itemBuilder: (context, index) {
                  final course = state.courses[index];
                  return CourseCard(course: course);
                },
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
