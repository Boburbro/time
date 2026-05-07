import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/extensions.dart';
import 'clock_style.dart';

ClockStyle getAuroraBorealisStyle() {
  return ClockStyle(
    build: (time, c) {
      final hm = DateFormat('HH:mm').format(time);
      final s = DateFormat('ss').format(time);
      final date = DateFormat('EEEE, MMMM d').format(time).toUpperCase();
      return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF0A0E27), Color(0xFF0D1B2A), Color(0xFF0A2A1A)],
          ),
        ),
        child: Stack(
          children: [
            // Aurora glow band 1
            Positioned(
              top: c.maxHeight * 0.15,
              left: -c.maxWidth * 0.2,
              child: Container(
                width: c.maxWidth * 1.4,
                height: c.maxHeight * 0.12,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF00FF9F).op(0.0),
                      const Color(0xFF00FF9F).op(0.12),
                      const Color(0xFF00FF9F).op(0.0),
                    ],
                  ),
                ),
              ),
            ),
            // Aurora glow band 2
            Positioned(
              top: c.maxHeight * 0.22,
              left: -c.maxWidth * 0.1,
              child: Container(
                width: c.maxWidth * 1.2,
                height: c.maxHeight * 0.08,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF7B2FBE).op(0.0),
                      const Color(0xFF7B2FBE).op(0.15),
                      const Color(0xFF7B2FBE).op(0.0),
                    ],
                  ),
                ),
              ),
            ),
            // Content
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  date,
                  style: GoogleFonts.spaceMono(
                    fontSize: c.maxWidth * 0.028,
                    color: const Color(0xFF00FF9F).op(0.6),
                    letterSpacing: 4,
                  ),
                ),
                SizedBox(height: c.maxHeight * 0.06),
                Center(
                  child: Text(
                    hm,
                    style: GoogleFonts.orbitron(
                      fontSize: c.maxWidth * 0.2,
                      fontWeight: FontWeight.w100,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 30,
                          color: const Color(0xFF00FF9F).op(0.4),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: c.maxHeight * 0.01),
                Center(
                  child: Text(
                    s,
                    style: GoogleFonts.orbitron(
                      fontSize: c.maxWidth * 0.06,
                      fontWeight: FontWeight.w100,
                      color: const Color(0xFF7B2FBE).op(0.8),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
