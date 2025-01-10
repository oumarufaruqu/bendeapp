import 'package:flutter/material.dart';
import 'package:bende/core/theme/app_typography.dart';
import 'package:bende/features/courses/domain/entities/topic.dart';

class TopicTile extends StatelessWidget {
  final Topic topic;
  final VoidCallback onTap;

  const TopicTile({
    super.key,
    required this.topic,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        topic.name,
        style: AppTypography.bodyLarge,
      ),
      subtitle: Text(
        topic.description,
        style: AppTypography.bodySmall,
      ),
      onTap: onTap,
    );
  }
}
