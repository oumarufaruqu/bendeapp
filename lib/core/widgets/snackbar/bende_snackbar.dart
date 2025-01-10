import 'package:flutter/material.dart';
import 'package:bende/core/theme/app_colors.dart';
import 'package:bende/core/theme/app_typography.dart';
import 'package:bende/core/theme/app_spacing.dart';
// ignore: unused_import
import 'package:bende/core/extensions/color_extension.dart';

enum SnackbarType {
  success,
  error,
  info,
  warning,
}

class BendeSnackbar extends StatelessWidget {
  final String message;
  final SnackbarType type;
  final VoidCallback? onAction;
  final String? actionLabel;

  const BendeSnackbar({
    super.key,
    required this.message,
    this.type = SnackbarType.info,
    this.onAction,
    this.actionLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        border: Border.all(
          color: _getBorderColor(),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        child: Row(
          children: [
            Icon(
              _getIcon(),
              color: _getIconColor(),
              size: 20,
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Text(
                message,
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.black.withValues(alpha: 0.8),
                ),
              ),
            ),
            if (actionLabel != null && onAction != null) ...[
              const SizedBox(width: AppSpacing.sm),
              TextButton(
                onPressed: onAction,
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(0, 0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  actionLabel!.toUpperCase(),
                  style: AppTypography.labelSmall.copyWith(
                    color: _getActionColor(),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Color _getBackgroundColor() {
    switch (type) {
      case SnackbarType.success:
        return const Color(0xFF4CAF50).withValues(alpha: 0.08);
      case SnackbarType.error:
        return const Color(0xFFF44336).withValues(alpha: 0.08);
      case SnackbarType.warning:
        return const Color(0xFFFFC107).withValues(alpha: 0.08);
      case SnackbarType.info:
        return AppColors.orange.withValues(alpha: 0.08);
    }
  }

  Color _getBorderColor() {
    switch (type) {
      case SnackbarType.success:
        return const Color(0xFF4CAF50).withValues(alpha: 0.2);
      case SnackbarType.error:
        return const Color(0xFFF44336).withValues(alpha: 0.2);
      case SnackbarType.warning:
        return const Color(0xFFFFC107).withValues(alpha: 0.2);
      case SnackbarType.info:
        return AppColors.orange.withValues(alpha: 0.2);
    }
  }

  Color _getIconColor() {
    switch (type) {
      case SnackbarType.success:
        return const Color(0xFF4CAF50);
      case SnackbarType.error:
        return const Color(0xFFF44336);
      case SnackbarType.warning:
        return const Color(0xFFFFC107);
      case SnackbarType.info:
        return AppColors.orange;
    }
  }

  Color _getActionColor() => _getIconColor();

  IconData _getIcon() {
    switch (type) {
      case SnackbarType.success:
        return Icons.check_circle_outline;
      case SnackbarType.error:
        return Icons.error_outline;
      case SnackbarType.warning:
        return Icons.warning_amber_outlined;
      case SnackbarType.info:
        return Icons.info_outline;
    }
  }

  // Helper method to show snackbar
  static void show({
    required BuildContext context,
    required String message,
    SnackbarType type = SnackbarType.info,
    VoidCallback? onAction,
    String? actionLabel,
    Duration duration = const Duration(seconds: 4),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: BendeSnackbar(
          message: message,
          type: type,
          onAction: onAction,
          actionLabel: actionLabel,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        duration: duration,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(AppSpacing.md),
        padding: EdgeInsets.zero,
      ),
    );
  }
}
