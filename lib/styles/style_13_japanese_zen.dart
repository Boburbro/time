import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/extensions.dart';
import 'clock_style.dart';

ClockStyle getJapaneseZenStyle() {
  return ClockStyle(
    build: (time, c) {
      final h = DateFormat('HH').format(time);
      final m = DateFormat('mm').format(time);
      final date = DateFormat('MMM').format(time).toUpperCase();
      final day = DateFormat('d').format(time);
      const bg = Color(0xFFF5F0E8);
      const sumi = Color(0xFF2D2926);
      return Container(
        color: bg,
        child: Stack(
          children: [
            // Single vertical ink stroke — right side
            Positioned(
              top: c.maxHeight * 0.08,
              right: c.maxWidth * 0.18,
              child: Container(
                width: 2,
                height: c.maxHeight * 0.84,
                color: sumi.op(0.08),
              ),
            ),
            // Enso circle — top left (incomplete circle)
            Positioned(
              top: c.maxHeight * 0.06,
              left: c.maxWidth * 0.06,
              child: Container(
                width: c.maxWidth * 0.14,
                height: c.maxWidth * 0.14,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: sumi.op(0.1), width: 2),
                ),
              ),
            ),
            // Time — lower left
            Positioned(
              bottom: c.maxHeight * 0.2,
              left: c.maxWidth * 0.08,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    h,
                    style: GoogleFonts.notoSerif(
                      fontSize: c.maxWidth * 0.3,
                      fontWeight: FontWeight.w100,
                      color: sumi,
                      height: 0.85,
                    ),
                  ),
                  Text(
                    m,
                    style: GoogleFonts.notoSerif(
                      fontSize: c.maxWidth * 0.3,
                      fontWeight: FontWeight.w100,
                      color: sumi.op(0.35),
                      height: 0.85,
                    ),
                  ),
                ],
              ),
            ),
            // Date — vertical on right column
            Positioned(
              top: c.maxHeight * 0.15,
              right: c.maxWidth * 0.08,
              child: Column(
                children: [
                  ...date
                      .split('')
                      .map(
                        (ch) => Text(
                          ch,
                          style: GoogleFonts.notoSerif(
                            fontSize: c.maxWidth * 0.04,
                            color: sumi.op(0.4),
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                  SizedBox(height: c.maxHeight * 0.02),
                  ...day
                      .split('')
                      .map(
                        (ch) => Text(
                          ch,
                          style: GoogleFonts.notoSerif(
                            fontSize: c.maxWidth * 0.05,
                            color: sumi.op(0.5),
                            fontWeight: FontWeight.w700,
                          ),
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
