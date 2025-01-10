import 'package:flutter/material.dart';
import 'package:bende/core/theme/app_colors.dart';
import 'package:bende/core/theme/app_typography.dart';
import 'package:bende/core/theme/app_spacing.dart';
// ignore: unused_import
import 'package:bende/core/extensions/color_extension.dart';

class BendeBottomSheet extends StatelessWidget {
  final String title;
  final Widget child;
  final double? height;
  final VoidCallback? onClose;

  const BendeBottomSheet({
    super.key,
    required this.title,
    required this.child,
    this.height,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(2)),
        border: Border(
          top: BorderSide(
            color: AppColors.black.withValues(alpha: 0.1),
            width: 1,
          ),
        ),
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
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title.toUpperCase(),
                    style: AppTypography.h3,
                  ),
                ),
                if (onClose != null)
                  IconButton(
                    onPressed: onClose,
                    icon: Icon(
                      Icons.close,
                      color: AppColors.black.withValues(alpha: 0.5),
                      size: 20,
                    ),
                  ),
              ],
            ),
          ),
          if (height != null) Expanded(child: child) else child,
        ],
      ),
    );
  }

  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    required Widget child,
    double? height,
    bool isDismissible = true,
    VoidCallback? onClose,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      isDismissible: isDismissible,
      builder: (context) => BendeBottomSheet(
        title: title,
        height: height,
        onClose: onClose ?? () => Navigator.pop(context),
        child: child,
      ),
    );
  }
}
