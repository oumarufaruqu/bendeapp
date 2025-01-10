import 'package:flutter/material.dart';
import 'package:bende/core/theme/app_colors.dart';
import 'package:bende/core/theme/app_typography.dart';
// ignore: unused_import
import 'package:bende/core/extensions/color_extension.dart';

class BendeProgress extends StatelessWidget {
  final double value; // 0.0 to 1.0
  final String? label;
  final bool showPercentage;

  const BendeProgress({
    super.key,
    required this.value,
    this.label,
    this.showPercentage = true,
  }) : assert(value >= 0 && value <= 1, 'Value must be between 0.0 and 1.0');

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          Row(
            children: [
              Text(
                label!.toUpperCase(),
                style: AppTypography.labelSmall,
              ),
              const SizedBox(width: 8),
              if (showPercentage)
                Text(
                  '${(value * 100).toInt()}%',
                  style: AppTypography.labelSmall.copyWith(
                    color: AppColors.orange,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
        ],
        Container(
          height: 4,
          decoration: BoxDecoration(
            color: AppColors.gray.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(2),
          ),
          child: FractionallySizedBox(
            widthFactor: value,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.orange,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
