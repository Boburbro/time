import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/extensions.dart';
import 'clock_style.dart';

ClockStyle getSunsetHorizonStyle() {
  return ClockStyle(
    build: (time, c) {
      final hm = DateFormat('HH:mm').format(time);
      final s = DateFormat('ss').format(time);
      final date = DateFormat('EEEE, d MMMM').format(time);
      return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 0.35, 0.55, 0.56, 1.0],
            colors: [
              Color(0xFF1B0A2E), // deep night
              Color(0xFF6B2F7B), // purple
              Color(0xFFF57C37), // orange horizon
              Color(0xFF1A0F0A), // ground start
              Color(0xFF0D0705), // deep ground
            ],
          ),
        ),
        child: Stack(
          children: [
            // Sun glow — sits on horizon
            Positioned(
              top: c.maxHeight * 0.38,
              left: c.maxWidth * 0.3,
              child: Container(
                width: c.maxWidth * 0.4,
                height: c.maxWidth * 0.4,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      const Color(0xFFF5C518).op(0.25),
                      const Color(0xFFF5C518).op(0.0),
                    ],
                  ),
                ),
              ),
            ),
            // Horizon line
            Positioned(
              top: c.maxHeight * 0.55,
              left: 0,
              right: 0,
              child: Container(
                height: 1,
                color: const Color(0xFFF57C37).op(0.4),
              ),
            ),
            // Time — centered on horizon
            Positioned(
              top: c.maxHeight * 0.35,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  hm,
                  style: GoogleFonts.quicksand(
                    fontSize: c.maxWidth * 0.2,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    height: 1,
                  ),
                ),
              ),
            ),
            // Seconds — below horizon
            Positioned(
              top: c.maxHeight * 0.58,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  s,
                  style: GoogleFonts.quicksand(
                    fontSize: c.maxWidth * 0.05,
                    color: const Color(0xFFF57C37).op(0.5),
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
            // Date — bottom
            Positioned(
              bottom: c.maxHeight * 0.08,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  date,
                  style: GoogleFonts.quicksand(
                    fontSize: c.maxWidth * 0.035,
                    color: Colors.white.op(0.25),
                    letterSpacing: 3,
                    fontWeight: FontWeight.w300,
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
