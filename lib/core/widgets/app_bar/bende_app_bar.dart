import 'package:flutter/material.dart';
import 'package:bende/core/theme/app_colors.dart';
import 'package:bende/core/theme/app_typography.dart';

class BendeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackPressed;
  final List<Widget>? actions;

  const BendeAppBar({
    super.key,
    required this.title,
    this.onBackPressed,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112,
      color: AppColors.white,
      child: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            if (onBackPressed != null)
              Positioned(
                left: 20,
                top: 0,
                bottom: 0,
                child: Center(
                  child: GestureDetector(
                    onTap: onBackPressed,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      width: 40,
                      height: 40,
                      child: Icon(
                        Icons.arrow_back,
                        color: AppColors.black,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: Text(
                  title.toUpperCase(),
                  style: AppTypography.h2.copyWith(
                    color: AppColors.black,
                    letterSpacing: 1,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),
            ),
            if (actions != null)
              Positioned(
                right: 20,
                top: 0,
                bottom: 0,
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: actions!,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(112);
}
