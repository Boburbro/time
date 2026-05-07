import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/extensions.dart';
import 'clock_style.dart';

ClockStyle getTypewriterStyle() {
  return ClockStyle(
    build: (time, c) {
      final hm = DateFormat('HH:mm').format(time);
      final s = DateFormat('ss').format(time);
      final day = DateFormat('EEEE').format(time);
      const paper = Color(0xFFEFE8D8);
      const ink = Color(0xFF2B2B2B);
      
      return Container(
        color: paper,
        child: Stack(
          children: [
            // Vignette / dirty edges
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    radius: 1.5,
                    colors: [
                      Colors.transparent,
                      ink.op(0.08),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(c.maxWidth * 0.08),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Report generated:',
                    style: GoogleFonts.specialElite(
                      fontSize: c.maxWidth * 0.03,
                      color: ink.op(0.7),
                    ),
                  ),
                  SizedBox(height: c.maxHeight * 0.02),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        hm,
                        style: GoogleFonts.specialElite(
                          fontSize: c.maxWidth * 0.25,
                          color: ink,
                          height: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: c.maxHeight * 0.02),
                        child: Text(
                          '.$s',
                          style: GoogleFonts.specialElite(
                            fontSize: c.maxWidth * 0.08,
                            color: ink.op(0.8),
                          ),
                        ),
                      ),
                      // Blinking cursor
                      if (time.second % 2 == 0)
                        Padding(
                          padding: EdgeInsets.only(bottom: c.maxHeight * 0.02, left: 4),
                          child: Container(
                            width: c.maxWidth * 0.03,
                            height: c.maxWidth * 0.08,
                            color: ink,
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: c.maxHeight * 0.04),
                  Text(
                    'DAY: ${day.toUpperCase()}',
                    style: GoogleFonts.specialElite(
                      fontSize: c.maxWidth * 0.04,
                      color: ink,
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
