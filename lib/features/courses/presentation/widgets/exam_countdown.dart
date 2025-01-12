import 'package:flutter/material.dart';
import 'package:bende/core/theme/app_typography.dart';
import 'package:bende/core/theme/app_colors.dart';

class ExamCountdown extends StatefulWidget {
  final DateTime targetDate;
  final Duration animationDuration;
  final VoidCallback? onAnimationComplete;

  const ExamCountdown({
    super.key,
    required this.targetDate,
    this.animationDuration = const Duration(seconds: 3),
    this.onAnimationComplete,
  });

  @override
  State<ExamCountdown> createState() => ExamCountdownState();
}

class ExamCountdownState extends State<ExamCountdown> {
  late int targetDays;
  late int startDays;
  Key animationKey = UniqueKey();

  @override
  void initState() {
    super.initState();
    _initializeDays();
  }

  void _initializeDays() {
    final now = DateTime.now();
    final difference = widget.targetDate.difference(now);
    targetDays = difference.isNegative ? 0 : difference.inDays;
    startDays = targetDays + 100;
  }

  void resetAnimation() {
    setState(() {
      _initializeDays();
      animationKey = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: AppColors.black,
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.white,
              border: Border(
                bottom: BorderSide(
                  color: AppColors.black,
                  width: 2,
                ),
              ),
            ),
            child: Text(
              'SINAVA KALAN GÜN SAYISI',
              textAlign: TextAlign.center,
              style: AppTypography.labelLarge.copyWith(
                letterSpacing: 1,
                color: AppColors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Semantics(
                  label: '$targetDays gün kaldı',
                  child: TweenAnimationBuilder<double>(
                    key: animationKey,
                    tween: Tween<double>(
                      begin: startDays.toDouble(),
                      end: targetDays.toDouble(),
                    ),
                    duration: widget.animationDuration,
                    curve: Curves.easeOutCubic,
                    builder: (context, value, child) {
                      final isAnimationComplete =
                          value == targetDays.toDouble();
                      return Transform.scale(
                        scale: isAnimationComplete ? 1.1 : 1.0,
                        child: Text(
                          value.toInt().toString().padLeft(3, '0'),
                          style: AppTypography.h1.copyWith(
                            fontSize: MediaQuery.of(context).size.width * 0.12,
                            color: AppColors.white,
                            letterSpacing: 4,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
