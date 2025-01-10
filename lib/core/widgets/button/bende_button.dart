import 'package:flutter/material.dart';
import 'package:bende/core/theme/app_colors.dart';
import 'package:bende/core/theme/app_typography.dart';

enum ButtonVariant {
  primary,
  secondary,
  black,
}

class BendeButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonVariant variant;
  final bool isLoading;
  final double? width;
  final double height;

  const BendeButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.variant = ButtonVariant.primary,
    this.isLoading = false,
    this.width,
    this.height = 48,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      width: width,
      height: height,
      child: MaterialButton(
        onPressed: isLoading ? null : onPressed,
        color: _getBackgroundColor(),
        elevation: 0,
        highlightElevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: _getBorderSide(),
        ),
        child: isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
                ),
              )
            : Text(
                text.toUpperCase(),
                style: AppTypography.buttonMedium.copyWith(
                  color: _getTextColor(),
                ),
              ),
      ),
    );
  }

  Color _getBackgroundColor() {
    switch (variant) {
      case ButtonVariant.primary:
        return AppColors.orange;
      case ButtonVariant.secondary:
        return Colors.transparent;
      case ButtonVariant.black:
        return AppColors.black;
    }
  }

  Color _getTextColor() {
    switch (variant) {
      case ButtonVariant.primary:
      case ButtonVariant.black:
        return AppColors.white;
      case ButtonVariant.secondary:
        return AppColors.black;
    }
  }

  BorderSide _getBorderSide() {
    switch (variant) {
      case ButtonVariant.primary:
      case ButtonVariant.black:
        return BorderSide.none;
      case ButtonVariant.secondary:
        return const BorderSide(color: AppColors.black, width: 2);
    }
  }
}
