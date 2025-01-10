import 'package:flutter/material.dart';
import 'package:bende/core/theme/app_colors.dart';
import 'package:bende/core/theme/app_typography.dart';
// ignore: unused_import
import 'package:bende/core/extensions/color_extension.dart';

class BendeSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;
  final String placeholder;

  const BendeSearchBar({
    super.key,
    this.controller,
    this.onChanged,
    this.onClear,
    this.placeholder = 'Ara...',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(
          color: AppColors.black.withValues(alpha: 0.1),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Row(
        children: [
          const SizedBox(width: 16),
          Icon(
            Icons.search,
            color: AppColors.black.withValues(alpha: 0.5),
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              style: AppTypography.bodyMedium,
              decoration: InputDecoration(
                hintText: placeholder,
                hintStyle: AppTypography.bodyMedium.copyWith(
                  color: AppColors.black.withValues(alpha: 0.5),
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
              textAlignVertical: TextAlignVertical.center,
            ),
          ),
          if (controller?.text.isNotEmpty ?? false) ...[
            GestureDetector(
              onTap: () {
                controller?.clear();
                onClear?.call();
              },
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Icon(
                  Icons.close,
                  color: AppColors.black.withValues(alpha: 0.5),
                  size: 20,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
