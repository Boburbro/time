import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/extensions.dart';
import 'clock_style.dart';

ClockStyle getSwissGridStyle() {
  return ClockStyle(
    build: (time, c) {
      final h = DateFormat('HH').format(time);
      final m = DateFormat('mm').format(time);
      final s = DateFormat('ss').format(time);
      final date = DateFormat('d . M . yyyy').format(time);
      return Container(
        color: const Color(0xFFFFFFFF),
        child: Column(
          children: [
            // Red top bar
            Container(height: 6, color: const Color(0xFFE8000D)),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: c.maxWidth * 0.08),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Hours
                    Expanded(
                      child: Text(
                        h,
                        style: GoogleFonts.bebasNeue(
                          fontSize: c.maxHeight * 0.38,
                          color: const Color(0xFF111111),
                          height: 1,
                        ),
                      ),
                    ),
                    // Vertical divider
                    Container(
                      width: 2,
                      height: c.maxHeight * 0.5,
                      color: const Color(0xFFE8000D),
                    ),
                    SizedBox(width: c.maxWidth * 0.06),
                    // Right column
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          m,
                          style: GoogleFonts.bebasNeue(
                            fontSize: c.maxHeight * 0.22,
                            color: const Color(0xFF111111),
                            height: 1,
                          ),
                        ),
                        Text(
                          s,
                          style: GoogleFonts.bebasNeue(
                            fontSize: c.maxHeight * 0.1,
                            color: const Color(0xFFE8000D),
                          ),
                        ),
                        SizedBox(height: c.maxHeight * 0.02),
                        Text(
                          date,
                          style: GoogleFonts.robotoMono(
                            fontSize: c.maxWidth * 0.028,
                            color: const Color(0xFF111111).op(0.45),
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
