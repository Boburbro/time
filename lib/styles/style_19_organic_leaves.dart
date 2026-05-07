import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/extensions.dart';
import 'clock_style.dart';

ClockStyle getOrganicLeavesStyle() {
  return ClockStyle(
    build: (time, c) {
      final hm = DateFormat('HH:mm').format(time);
      final s = DateFormat('ss').format(time);
      final date = DateFormat('d MMM').format(time);
      const bg = Color(0xFFEFF7F1);
      const leaf = Color(0xFFB0D8B0);
      return Container(
        color: bg,
        child: Stack(
          children: [
            // Simple leaf pattern using transformed containers
            ...List.generate(6, (i) {
              final angle = (i * 60) * 3.1416 / 180;
              return Positioned(
                left: c.maxWidth * (0.2 + i * 0.1),
                top: c.maxHeight * 0.15,
                child: Transform.rotate(
                  angle: angle,
                  child: Container(
                    width: c.maxWidth * 0.12,
                    height: c.maxHeight * 0.08,
                    decoration: BoxDecoration(
                      color: leaf.op(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              );
            }),
            // Time text
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    hm,
                    style: GoogleFonts.pacifico(
                      fontSize: c.maxWidth * 0.22,
                      color: leaf.op(0.6),
                    ),
                  ),
                  Text(
                    s,
                    style: GoogleFonts.pacifico(
                      fontSize: c.maxWidth * 0.07,
                      color: leaf.op(0.4),
                    ),
                  ),
                  SizedBox(height: c.maxHeight * 0.02),
                  Text(
                    date,
                    style: GoogleFonts.robotoMono(
                      fontSize: c.maxWidth * 0.03,
                      color: leaf.op(0.5),
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
