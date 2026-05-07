import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/extensions.dart';
import 'clock_style.dart';

ClockStyle getNeonGridStyle() {
  return ClockStyle(
    build: (time, c) {
      final hm = DateFormat('HH:mm').format(time);
      final s = DateFormat('ss').format(time);
      const bg = Color(0xFF0D0015);
      const neon = Color(0xFF00FF41);
      return Container(
        color: bg,
        child: Stack(
          children: [
            // Neon grid lines
            ...List.generate(12, (i) {
              return Positioned(
                left: c.maxWidth * i / 12,
                top: 0,
                bottom: 0,
                child: Container(width: 0.8, color: neon.op(0.15)),
              );
            }),
            ...List.generate(20, (i) {
              return Positioned(
                top: c.maxHeight * i / 20,
                left: 0,
                right: 0,
                child: Container(height: 0.8, color: neon.op(0.15)),
              );
            }),
            // Time display
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    hm,
                    style: GoogleFonts.orbitron(
                      fontSize: c.maxWidth * 0.25,
                      color: neon,
                      height: 1,
                    ),
                  ),
                  Text(
                    s,
                    style: GoogleFonts.orbitron(
                      fontSize: c.maxWidth * 0.07,
                      color: neon.op(0.6),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
