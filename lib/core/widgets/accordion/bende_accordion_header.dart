import 'package:flutter/material.dart';
import 'package:bende/core/theme/app_colors.dart';
import 'package:bende/core/theme/app_typography.dart';
// ignore: unused_import
import 'package:bende/core/extensions/color_extension.dart';

class BendeAccordionHeader extends StatelessWidget {
  final String title;
  final int topicNumber;
  final int subTopicCount;
  final bool isExpanded;
  final bool isAllCompleted;
  final Animation<double> iconTurns;
  final VoidCallback onTap;

  const BendeAccordionHeader({
    super.key,
    required this.title,
    required this.topicNumber,
    required this.subTopicCount,
    required this.isExpanded,
    required this.isAllCompleted,
    required this.iconTurns,
    required this.onTap,
  });

  Widget _buildTopicNumber() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: AppColors.orange,
          width: 1,
        ),
      ),
      child: Center(
        child: Text(
          topicNumber.toString().padLeft(2, '0'),
          style: AppTypography.h3.copyWith(
            color: AppColors.orange,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }

  Widget _buildTopicInfo() {
    return Row(
      children: [
        Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            color: AppColors.orange.withValues(alpha: 0.2),
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          '$subTopicCount ALT KONU',
          style: AppTypography.bodyLarge.copyWith(
            color: AppColors.orange,
            letterSpacing: 0.8,
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
        if (isAllCompleted) ...[
          const SizedBox(width: 6),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 6,
              vertical: 2,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF4CAF50).withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(3),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.check_circle,
                  size: 10,
                  color: const Color(0xFF4CAF50).withValues(alpha: 0.8),
                ),
                const SizedBox(width: 3),
                Text(
                  'TAMAMLANDI',
                  style: AppTypography.bodySmall.copyWith(
                    color: const Color(0xFF4CAF50).withValues(alpha: 0.8),
                    letterSpacing: 0.3,
                    fontSize: 9,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(
            top: const Radius.circular(4),
          ),
          border: Border(
            bottom: BorderSide(
              color: isExpanded
                  ? AppColors.orange.withValues(alpha: 0.3)
                  : Colors.transparent,
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: [
            _buildTopicNumber(),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.toUpperCase(),
                    style: AppTypography.h3.copyWith(
                      color: AppColors.black.withValues(alpha: 0.9),
                      letterSpacing: 0.5,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 4),
                  _buildTopicInfo(),
                ],
              ),
            ),
            RotationTransition(
              turns: iconTurns,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: isExpanded
                      ? AppColors.orange.withValues(alpha: 0.08)
                      : Colors.transparent,
                  border: Border.all(
                    color: AppColors.orange.withValues(alpha: 0.3),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Icon(
                  Icons.keyboard_arrow_down,
                  color: AppColors.orange,
                  size: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
