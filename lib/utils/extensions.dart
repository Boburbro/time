import 'package:flutter/material.dart';

extension ColorOpacityExtension on Color {
  /// Custom opacity extension to avoid deprecated withOpacity
  /// and provide a cleaner syntax.
  Color op(double opacity) {
    assert(opacity >= 0.0 && opacity <= 1.0);
    return withAlpha((255.0 * opacity).round());
  }
}
