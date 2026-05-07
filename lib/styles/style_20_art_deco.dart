import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/extensions.dart';
import 'clock_style.dart';

ClockStyle getArtDecoStyle() {
  return ClockStyle(
    build: (time, c) {
      final h = DateFormat('HH').format(time);
      final m = DateFormat('mm').format(time);
      final s = DateFormat('ss').format(time);
      final date = DateFormat('MMM d, yyyy').format(time).toUpperCase();
      const bg = Color(0xFF1C1C1C);
      const gold = Color(0xFFD4AF37);
      return Container(
        color: bg,
        child: Stack(
          children: [
            // Top horizontal gold bar
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(height: c.maxHeight * 0.06, color: gold),
            ),
            // Centered time with art deco font
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '$h:$m',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: c.maxWidth * 0.2,
                      color: gold,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    s,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: c.maxWidth * 0.07,
                      color: gold.op(0.7),
                    ),
                  ),
                ],
              ),
            ),
            // Bottom date block with border
            Positioned(
              bottom: c.maxHeight * 0.04,
              left: c.maxWidth * 0.1,
              right: c.maxWidth * 0.1,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: c.maxHeight * 0.015,
                  horizontal: c.maxWidth * 0.02,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: gold, width: 1.5),
                ),
                child: Center(
                  child: Text(
                    date,
                    style: GoogleFonts.robotoMono(
                      fontSize: c.maxWidth * 0.025,
                      color: gold,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
