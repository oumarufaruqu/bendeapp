import 'package:flutter/material.dart';
import 'package:bende/core/theme/app_typography.dart';
import 'package:bende/features/courses/domain/entities/course.dart';

class CourseDetailPage extends StatelessWidget {
  final Course course;

  const CourseDetailPage({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          course.title,
          style: AppTypography.h2,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Course Code: ${course.code}',
              style: AppTypography.bodyLarge,
            ),
            const SizedBox(height: 16),
            Text(
              course.description,
              style: AppTypography.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
