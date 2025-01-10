import 'package:flutter/material.dart';
import 'package:bende/core/theme/app_colors.dart';
import 'package:bende/core/theme/app_typography.dart';
// ignore: unused_import
import 'package:bende/core/extensions/color_extension.dart';

enum ChipVariant {
  primary,
  secondary,
  success,
  warning,
  error,
}

class BendeChip extends StatelessWidget {
  final String label;
  final ChipVariant variant;
  final VoidCallback? onTap;
  final IconData? icon;

  const BendeChip({
    super.key,
    required this.label,
    this.variant = ChipVariant.primary,
    this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        decoration: BoxDecoration(
          color: _getBackgroundColor(),
          borderRadius: BorderRadius.circular(2),
          border: Border.all(
            color: _getBorderColor(),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: 12,
                color: _getTextColor(),
              ),
              const SizedBox(width: 4),
            ],
            Text(
              label.toUpperCase(),
              style: AppTypography.labelSmall.copyWith(
                color: _getTextColor(),
                fontSize: 10,
                letterSpacing: 0.5,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getBackgroundColor() {
    switch (variant) {
      case ChipVariant.primary:
        return AppColors.orange.withValues(alpha: 0.08);
      case ChipVariant.secondary:
        return AppColors.black.withValues(alpha: 0.05);
      case ChipVariant.success:
        return const Color(0xFF4CAF50).withValues(alpha: 0.08);
      case ChipVariant.warning:
        return const Color(0xFFFFC107).withValues(alpha: 0.08);
      case ChipVariant.error:
        return const Color(0xFFF44336).withValues(alpha: 0.08);
    }
  }

  Color _getBorderColor() {
    switch (variant) {
      case ChipVariant.primary:
        return AppColors.orange.withValues(alpha: 0.3);
      case ChipVariant.secondary:
        return AppColors.black.withValues(alpha: 0.1);
      case ChipVariant.success:
        return const Color(0xFF4CAF50).withValues(alpha: 0.3);
      case ChipVariant.warning:
        return const Color(0xFFFFC107).withValues(alpha: 0.3);
      case ChipVariant.error:
        return const Color(0xFFF44336).withValues(alpha: 0.3);
    }
  }

  Color _getTextColor() {
    switch (variant) {
      case ChipVariant.primary:
        return AppColors.orange;
      case ChipVariant.secondary:
        return AppColors.black.withValues(alpha: 0.8);
      case ChipVariant.success:
        return const Color(0xFF4CAF50);
      case ChipVariant.warning:
        return const Color(0xFFFFC107);
      case ChipVariant.error:
        return const Color(0xFFF44336);
    }
  }
}
