import 'package:flutter/material.dart';
import 'package:bende/core/theme/app_colors.dart';
import 'package:bende/core/theme/app_typography.dart';
// ignore: unused_import
import 'package:bende/core/extensions/color_extension.dart';

class BendeTooltip extends StatelessWidget {
  final String message;
  final Widget child;
  final bool preferBelow;
  final EdgeInsetsGeometry? padding;

  const BendeTooltip({
    super.key,
    required this.message,
    required this.child,
    this.preferBelow = true,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      preferBelow: preferBelow,
      padding: padding ??
          const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
      decoration: BoxDecoration(
        color: AppColors.black.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(2),
      ),
      textStyle: AppTypography.labelSmall.copyWith(
        color: AppColors.white,
        fontSize: 10,
      ),
      child: child,
    );
  }
}
