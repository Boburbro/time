import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/extensions.dart';
import 'clock_style.dart';

ClockStyle getVaporGlassStyle() {
  return ClockStyle(
    build: (time, c) {
      final hm = DateFormat('HH:mm').format(time);
      final s = DateFormat('ss').format(time);
      final date = DateFormat('EEE d MMM').format(time).toUpperCase();
      return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFFB3D9), Color(0xFFB3C6FF), Color(0xFFB3FFE8)],
          ),
        ),
        child: Center(
          child: Container(
            width: c.maxWidth * 0.82,
            padding: EdgeInsets.symmetric(
              vertical: c.maxHeight * 0.07,
              horizontal: c.maxWidth * 0.07,
            ),
            decoration: BoxDecoration(
              color: Colors.white.op(0.25),
              borderRadius: BorderRadius.circular(32),
              border: Border.all(color: Colors.white.op(0.6), width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.op(0.3),
                  blurRadius: 40,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  date,
                  style: GoogleFonts.nunito(
                    fontSize: c.maxWidth * 0.035,
                    letterSpacing: 4,
                    color: const Color(0xFF4A3F6B).op(0.7),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: c.maxHeight * 0.02),
                Text(
                  hm,
                  style: GoogleFonts.nunito(
                    fontSize: c.maxWidth * 0.2,
                    fontWeight: FontWeight.w900,
                    color: const Color(0xFF2D1B69),
                    height: 1,
                  ),
                ),
                Text(
                  s,
                  style: GoogleFonts.nunito(
                    fontSize: c.maxWidth * 0.07,
                    fontWeight: FontWeight.w300,
                    color: const Color(0xFF4A3F6B).op(0.5),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
