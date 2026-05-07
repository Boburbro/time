import 'package:flutter/material.dart';

/// Each style is a completely independent widget builder.
/// Time and layout, fonts, effects, positioning — everything is unique.
class ClockStyle {
  final Widget Function(DateTime time, BoxConstraints constraints) build;
  const ClockStyle({required this.build});
}
