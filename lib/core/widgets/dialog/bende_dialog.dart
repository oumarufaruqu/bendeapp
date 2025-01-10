import 'package:flutter/material.dart';
import 'package:bende/core/theme/app_colors.dart';
import 'package:bende/core/theme/app_typography.dart';
import 'package:bende/core/theme/app_spacing.dart';
// ignore: unused_import
import 'package:bende/core/extensions/color_extension.dart';
import 'package:bende/core/widgets/button/bende_button.dart';

class BendeDialog extends StatelessWidget {
  final String title;
  final String message;
  final String? confirmText;
  final String? cancelText;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final bool isDestructive;

  const BendeDialog({
    super.key,
    required this.title,
    required this.message,
    this.confirmText,
    this.cancelText,
    this.onConfirm,
    this.onCancel,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(AppSpacing.lg),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(
            color: AppColors.black.withValues(alpha: 0.1),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(2),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.black.withValues(alpha: 0.1),
                    width: 1,
                  ),
                ),
              ),
              child: Text(
                title.toUpperCase(),
                style: AppTypography.h3,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Text(
                message,
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.black.withValues(alpha: 0.8),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.gray.withValues(alpha: 0.05),
                border: Border(
                  top: BorderSide(
                    color: AppColors.black.withValues(alpha: 0.1),
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (cancelText != null)
                    Expanded(
                      child: BendeButton(
                        text: cancelText!,
                        variant: ButtonVariant.secondary,
                        onPressed: () {
                          Navigator.of(context).pop();
                          onCancel?.call();
                        },
                      ),
                    ),
                  if (cancelText != null && confirmText != null)
                    const SizedBox(width: AppSpacing.md),
                  if (confirmText != null)
                    Expanded(
                      child: BendeButton(
                        text: confirmText!,
                        variant: isDestructive
                            ? ButtonVariant.black
                            : ButtonVariant.primary,
                        onPressed: () {
                          Navigator.of(context).pop();
                          onConfirm?.call();
                        },
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to show dialog
  static Future<void> show({
    required BuildContext context,
    required String title,
    required String message,
    String? confirmText,
    String? cancelText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    bool isDestructive = false,
  }) {
    return showDialog(
      context: context,
      builder: (context) => BendeDialog(
        title: title,
        message: message,
        confirmText: confirmText,
        cancelText: cancelText,
        onConfirm: onConfirm,
        onCancel: onCancel,
        isDestructive: isDestructive,
      ),
    );
  }
}
