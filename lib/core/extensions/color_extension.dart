import 'package:flutter/material.dart';

extension ColorExtension on Color {
  Color withValues({int? red, int? green, int? blue, double? alpha}) {
    return Color.fromARGB(
      (alpha ?? 1.0 * 255).round(),
      // ignore: deprecated_member_use
      red ?? this.red,
      // ignore: deprecated_member_use
      green ?? this.green,
      // ignore: deprecated_member_use
      blue ?? this.blue,
    );
  }
}
