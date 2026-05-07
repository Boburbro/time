import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/extensions.dart';
import 'clock_style.dart';

ClockStyle getLuxurySpaStyle() {
  return ClockStyle(
    build: (time, c) {
      final hm = DateFormat('HH : mm').format(time);
      final s = DateFormat('ss').format(time);
      final date = DateFormat('EEEE').format(time).toUpperCase();
      final dayNum = DateFormat('d MMMM yyyy').format(time).toUpperCase();
      const ink = Color(0xFF3D2B1F);
      return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF7EFE5), Color(0xFFEDD9C0)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              date,
              style: GoogleFonts.cormorantGaramond(
                fontSize: c.maxWidth * 0.04,
                letterSpacing: 10,
                color: ink.op(0.5),
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: c.maxHeight * 0.02),
            Text(
              hm,
              style: GoogleFonts.cormorantGaramond(
                fontSize: c.maxWidth * 0.2,
                fontWeight: FontWeight.w300,
                color: ink,
                height: 1,
              ),
            ),
            SizedBox(height: c.maxHeight * 0.005),
            Text(
              s,
              style: GoogleFonts.cormorantGaramond(
                fontSize: c.maxWidth * 0.05,
                color: ink.op(0.4),
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: c.maxHeight * 0.04),
            SizedBox(
              width: c.maxWidth * 0.3,
              child: Divider(color: ink.op(0.3), thickness: 0.5),
            ),
            SizedBox(height: c.maxHeight * 0.02),
            Text(
              dayNum,
              style: GoogleFonts.cormorantGaramond(
                fontSize: c.maxWidth * 0.035,
                letterSpacing: 5,
                color: ink.op(0.45),
              ),
            ),
          ],
        ),
      );
    },
  );
}
