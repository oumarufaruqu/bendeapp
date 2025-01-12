import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bende/core/theme/app_spacing.dart';
import 'package:bende/core/theme/app_typography.dart';
import 'package:bende/core/widgets/card/bende_lesson_card.dart';
import 'package:bende/core/widgets/app_bar/bende_app_bar.dart';
import 'package:bende/core/widgets/navigation/bende_bottom_bar.dart';
import 'package:bende/core/widgets/refresh/bende_refresh_indicator.dart';
import 'package:bende/features/courses/presentation/bloc/course_bloc.dart';
import 'package:bende/features/courses/presentation/pages/course_detail_page.dart';
import 'package:bende/features/courses/presentation/widgets/exam_countdown.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  final GlobalKey<ExamCountdownState> _countdownKey = GlobalKey();
  final examDate = DateTime(2025, 7, 13);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => context.read<CourseBloc>()..add(LoadCourses()),
      child: Scaffold(
        appBar: const BendeAppBar(
          title: 'Dersler',
        ),
        body: BendeRefreshIndicator(
          onRefresh: () async {
            context.read<CourseBloc>().add(LoadCourses());
            _countdownKey.currentState?.resetAnimation();
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: ExamCountdown(
                  key: _countdownKey,
                  targetDate: examDate,
                ),
              ),
              Expanded(
                child: BlocBuilder<CourseBloc, CourseState>(
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
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.md,
                          vertical: AppSpacing.sm,
                        ),
                        itemCount: state.courses.length,
                        itemBuilder: (context, index) {
                          final course = state.courses[index];
                          return Padding(
                            padding:
                                const EdgeInsets.only(bottom: AppSpacing.xs),
                            child: BendeLessonCard(
                              title: course.title,
                              subtitle: course.description,
                              code: course.code,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CourseDetailPage(
                                      course: course,
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    }

                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BendeBottomBar(
          currentIndex: 0,
          onTap: (index) {
            // TODO: Implement navigation
          },
        ),
      ),
    );
  }
}
