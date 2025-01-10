import 'package:flutter/material.dart';
import 'package:bende/core/theme/app_typography.dart';
import 'package:bende/features/courses/domain/entities/course.dart';
import 'package:bende/features/courses/presentation/widgets/topic_tile.dart';
import 'package:bende/features/courses/presentation/pages/flashcards_page.dart';

class SubjectAccordion extends StatelessWidget {
  final Subject subject;

  const SubjectAccordion({
    super.key,
    required this.subject,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        subject.name,
        style: AppTypography.h3,
      ),
      children: subject.topics.map((topic) {
        return TopicTile(
          topic: topic,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FlashcardsPage(topic: topic),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
