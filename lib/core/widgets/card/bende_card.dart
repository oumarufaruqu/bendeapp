import 'package:flutter/material.dart';
import 'package:bende/core/theme/app_colors.dart';
import 'package:bende/core/theme/app_spacing.dart';
import 'package:bende/core/theme/app_typography.dart';
// ignore: unused_import
import 'package:bende/core/extensions/color_extension.dart';

class BendeCard extends StatelessWidget {
  final String? title;
  final Widget child;
  final EdgeInsets? padding;
  final VoidCallback? onTap;
  final bool hasBorder;

  const BendeCard({
    super.key,
    this.title,
    required this.child,
    this.padding,
    this.onTap,
    this.hasBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          border:
              hasBorder ? Border.all(color: AppColors.black, width: 2) : null,
          boxShadow: hasBorder
              ? null
              : [
                  BoxShadow(
                    offset: const Offset(1, 1),
                    blurRadius: 0,
                    color: AppColors.black.withValues(alpha: 0.2),
                  ),
                ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (title != null) ...[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppSpacing.sm),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppColors.black, width: 2),
                  ),
                ),
                child: Text(
                  title!.toUpperCase(),
                  style: AppTypography.h3,
                ),
              ),
            ],
            Padding(
              padding: padding ?? const EdgeInsets.all(AppSpacing.md),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
