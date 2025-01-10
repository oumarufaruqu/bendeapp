import 'package:flutter/material.dart';
import 'package:bende/core/theme/app_typography.dart';
import 'package:bende/features/courses/domain/entities/course.dart';
import 'package:bende/features/courses/presentation/widgets/subject_accordion.dart';

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
      body: ListView.builder(
        itemCount: course.subjects.length,
        itemBuilder: (context, index) {
          final subject = course.subjects[index];
          return SubjectAccordion(subject: subject);
        },
      ),
    );
  }
}
