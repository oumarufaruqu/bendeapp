import 'package:flutter/material.dart';
import 'package:bende/core/theme/app_spacing.dart';
import 'package:bende/core/theme/app_typography.dart';
import 'package:bende/features/courses/domain/entities/course.dart';
import 'package:bende/features/courses/presentation/pages/course_detail_page.dart';

class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: ListTile(
        title: Text(
          course.title,
          style: AppTypography.h3,
        ),
        subtitle: Text(
          course.description,
          style: AppTypography.bodyMedium,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CourseDetailPage(course: course),
            ),
          );
        },
      ),
    );
  }
}
