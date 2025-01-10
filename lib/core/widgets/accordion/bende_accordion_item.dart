import 'package:flutter/material.dart';
import 'package:bende/core/theme/app_colors.dart';
import 'package:bende/core/theme/app_typography.dart';
// ignore: unused_import
import 'package:bende/core/extensions/color_extension.dart';

class SubTopic {
  final String title;
  final int cardCount;
  final bool isCompleted;
  final VoidCallback? onTap;

  const SubTopic({
    required this.title,
    required this.cardCount,
    this.isCompleted = false,
    this.onTap,
  });
}

class BendeAccordionItem extends StatelessWidget {
  final SubTopic subtopic;

  const BendeAccordionItem({
    super.key,
    required this.subtopic,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: subtopic.onTap,
        splashColor: AppColors.black.withValues(alpha: 0.1),
        highlightColor: AppColors.black.withValues(alpha: 0.05),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border(
              bottom: BorderSide(
                color: AppColors.gray.withValues(alpha: 0.1),
                width: 1,
              ),
            ),
          ),
          child: Row(
            children: [
              const SizedBox(width: 56),
              Expanded(
                child: Text(
                  subtopic.title,
                  style: AppTypography.bodyLarge.copyWith(
                    color: AppColors.black.withValues(alpha: 0.8),
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                  color: AppColors.orange.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.library_books_outlined,
                      size: 12,
                      color: AppColors.orange.withValues(alpha: 0.8),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${subtopic.cardCount}',
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.orange,
                        letterSpacing: 0.5,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Icon(
                subtopic.isCompleted
                    ? Icons.check_circle
                    : Icons.radio_button_unchecked,
                color: subtopic.isCompleted
                    ? AppColors.orange
                    : AppColors.gray.withValues(alpha: 0.3),
                size: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
