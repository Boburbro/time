import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/extensions.dart';
import 'clock_style.dart';

ClockStyle getDeepCosmosStyle() {
  return ClockStyle(
    build: (time, c) {
      final hm = DateFormat('HH:mm').format(time);
      final s = DateFormat('ss').format(time);
      final date = DateFormat('EEEE · d MMMM').format(time).toUpperCase();
      const glow = Color(0xFF7DF9FF);
      return Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0, -0.3),
            radius: 1.2,
            colors: [Color(0xFF1A0533), Color(0xFF03001C)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              date,
              style: GoogleFonts.spaceMono(
                fontSize: c.maxWidth * 0.028,
                color: glow.op(0.5),
                letterSpacing: 5,
              ),
            ),
            SizedBox(height: c.maxHeight * 0.04),
            Text(
              hm,
              style: GoogleFonts.orbitron(
                fontSize: c.maxWidth * 0.2,
                fontWeight: FontWeight.w900,
                color: Colors.white,
                height: 1,
                shadows: [
                  Shadow(blurRadius: 40, color: glow.op(0.8)),
                  Shadow(blurRadius: 80, color: glow.op(0.4)),
                ],
              ),
            ),
            SizedBox(height: c.maxHeight * 0.01),
            Text(
              s,
              style: GoogleFonts.orbitron(
                fontSize: c.maxWidth * 0.07,
                fontWeight: FontWeight.w200,
                color: glow.op(0.6),
              ),
            ),
          ],
        ),
      );
    },
  );
}
