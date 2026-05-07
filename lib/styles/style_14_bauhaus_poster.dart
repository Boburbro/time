import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/extensions.dart';
import 'clock_style.dart';

ClockStyle getBauhausPosterStyle() {
  return ClockStyle(
    build: (time, c) {
      final h = DateFormat('HH').format(time);
      final m = DateFormat('mm').format(time);
      final s = DateFormat('ss').format(time);
      final date = DateFormat('d MMM yyyy').format(time).toUpperCase();
      const red = Color(0xFFDE3C4B);
      const blue = Color(0xFF1B4B73);
      const yellow = Color(0xFFF5C518);
      const dark = Color(0xFF1A1A1A);
      return Container(
        color: const Color(0xFFF2EDDE),
        child: Stack(
          children: [
            // Red block — top right
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: c.maxWidth * 0.35,
                height: c.maxHeight * 0.18,
                color: red,
              ),
            ),
            // Blue circle — bottom left
            Positioned(
              bottom: c.maxHeight * 0.06,
              left: c.maxWidth * 0.06,
              child: Container(
                width: c.maxWidth * 0.22,
                height: c.maxWidth * 0.22,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: blue,
                ),
              ),
            ),
            // Yellow bar — horizontal, mid
            Positioned(
              top: c.maxHeight * 0.55,
              left: 0,
              child: Container(
                width: c.maxWidth * 0.45,
                height: c.maxHeight * 0.025,
                color: yellow,
              ),
            ),
            // Hours — large, overlapping the red block
            Positioned(
              top: c.maxHeight * 0.06,
              left: c.maxWidth * 0.07,
              child: Text(
                h,
                style: GoogleFonts.bebasNeue(
                  fontSize: c.maxHeight * 0.35,
                  color: dark,
                  height: 1,
                ),
              ),
            ),
            // Minutes — right of center
            Positioned(
              top: c.maxHeight * 0.38,
              right: c.maxWidth * 0.1,
              child: Text(
                ':$m',
                style: GoogleFonts.bebasNeue(
                  fontSize: c.maxHeight * 0.18,
                  color: dark.op(0.7),
                  height: 1,
                ),
              ),
            ),
            // Seconds inside blue circle
            Positioned(
              bottom:
                  c.maxHeight * 0.06 +
                  (c.maxWidth * 0.22 - c.maxWidth * 0.06) / 2,
              left: c.maxWidth * 0.06 + c.maxWidth * 0.06,
              child: Text(
                s,
                style: GoogleFonts.bebasNeue(
                  fontSize: c.maxWidth * 0.1,
                  color: const Color(0xFFF2EDDE),
                  height: 1,
                ),
              ),
            ),
            // Date bottom right
            Positioned(
              bottom: c.maxHeight * 0.04,
              right: c.maxWidth * 0.07,
              child: Text(
                date,
                style: GoogleFonts.robotoMono(
                  fontSize: c.maxWidth * 0.025,
                  color: dark.op(0.4),
                  letterSpacing: 2,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
