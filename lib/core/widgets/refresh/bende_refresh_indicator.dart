import 'package:flutter/material.dart';
import 'dart:async';
import 'package:bende/core/theme/app_colors.dart';

class BendeRefreshIndicator extends StatelessWidget {
  final Widget child;
  final Future<void> Function() onRefresh;
  final Color? color;
  final Color? backgroundColor;
  final double strokeWidth;
  final Duration timeout;
  final VoidCallback? onTimeout;
  final ValueChanged<Object>? onError;
  final String? semanticsLabel;

  const BendeRefreshIndicator({
    super.key,
    required this.child,
    required this.onRefresh,
    this.color = AppColors.black,
    this.backgroundColor = AppColors.white,
    this.strokeWidth = 2,
    this.timeout = const Duration(seconds: 30),
    this.onTimeout,
    this.onError,
    this.semanticsLabel,
  });

  Future<void> _handleRefresh() async {
    try {
      await Future.any([
        onRefresh(),
        Future.delayed(timeout).then((_) {
          onTimeout?.call();
          throw TimeoutException('Refresh timeout');
        }),
      ]);
    } catch (e) {
      onError?.call(e);
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticsLabel ?? 'Pull to refresh content',
      child: RefreshIndicator(
        onRefresh: _handleRefresh,
        color: color,
        backgroundColor: backgroundColor,
        strokeWidth: strokeWidth,
        child: child,
      ),
    );
  }
}
