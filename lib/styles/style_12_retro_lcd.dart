import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/extensions.dart';
import 'clock_style.dart';

ClockStyle getRetroLcdStyle() {
  return ClockStyle(
    build: (time, c) {
      final hm = DateFormat('HH:mm').format(time);
      final s = DateFormat('ss').format(time);
      final date = DateFormat('d.MM.yy').format(time);
      final day = DateFormat('EEE').format(time).toUpperCase();
      const bg = Color(0xFF2A3C24);
      const lcd = Color(0xFFB8D882);
      const lcdDim = Color(0xFF4A5E3E);
      return Container(
        color: bg,
        child: Stack(
          children: [
            // LCD panel bezel effect — inner shadow
            Positioned.fill(
              child: Container(
                margin: EdgeInsets.all(c.maxWidth * 0.06),
                decoration: BoxDecoration(
                  color: bg,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: lcdDim, width: 2),
                ),
              ),
            ),
            // Day label — top left inside bezel
            Positioned(
              top: c.maxHeight * 0.1,
              left: c.maxWidth * 0.1,
              child: Text(
                day,
                style: GoogleFonts.vt323(
                  fontSize: c.maxWidth * 0.06,
                  color: lcd.op(0.5),
                ),
              ),
            ),
            // Main time — center
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    hm,
                    style: GoogleFonts.vt323(
                      fontSize: c.maxWidth * 0.28,
                      color: lcd,
                      height: 1,
                    ),
                  ),
                  Text(
                    s,
                    style: GoogleFonts.vt323(
                      fontSize: c.maxWidth * 0.12,
                      color: lcd.op(0.4),
                    ),
                  ),
                ],
              ),
            ),
            // Date — bottom right inside bezel
            Positioned(
              bottom: c.maxHeight * 0.1,
              right: c.maxWidth * 0.1,
              child: Text(
                date,
                style: GoogleFonts.vt323(
                  fontSize: c.maxWidth * 0.05,
                  color: lcd.op(0.6),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
