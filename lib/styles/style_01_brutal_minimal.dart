import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/extensions.dart';
import 'clock_style.dart';

ClockStyle getBrutalMinimalStyle() {
  return ClockStyle(
    build: (time, c) {
      final h = DateFormat('HH').format(time);
      final m = DateFormat('mm').format(time);
      final s = DateFormat('ss').format(time);
      final date = DateFormat('EEE, MMM d').format(time).toUpperCase();
      return Container(
        color: const Color(0xFFF5F5F0),
        child: Stack(
          children: [
            // Giant hour — bottom left
            Positioned(
              left: -c.maxWidth * 0.04,
              bottom: -c.maxHeight * 0.06,
              child: Text(
                h,
                style: GoogleFonts.bebasNeue(
                  fontSize: c.maxWidth * 0.72,
                  color: const Color(0xFF111111).op(0.08),
                ),
              ),
            ),
            // Minutes — top right
            Positioned(
              top: c.maxHeight * 0.08,
              right: c.maxWidth * 0.07,
              child: Text(
                m,
                style: GoogleFonts.robotoMono(
                  fontSize: c.maxWidth * 0.18,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF111111),
                ),
              ),
            ),
            // Seconds bar
            Positioned(
              top: c.maxHeight * 0.08 + c.maxWidth * 0.22,
              right: c.maxWidth * 0.07,
              child: Text(
                ':$s',
                style: GoogleFonts.robotoMono(
                  fontSize: c.maxWidth * 0.07,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF111111).op(0.4),
                ),
              ),
            ),
            // Date — bottom right
            Positioned(
              bottom: c.maxHeight * 0.08,
              right: c.maxWidth * 0.07,
              child: Text(
                date,
                style: GoogleFonts.robotoMono(
                  fontSize: c.maxWidth * 0.03,
                  letterSpacing: 3,
                  color: const Color(0xFF111111).op(0.5),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
