import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/extensions.dart';
import 'clock_style.dart';

ClockStyle getCyberpunkSplitStyle() {
  return ClockStyle(
    build: (time, c) {
      final h = DateFormat('HH').format(time);
      final m = DateFormat('mm').format(time);
      final s = DateFormat(':ss').format(time);
      final date = DateFormat('EEE d MMM').format(time).toUpperCase();
      const dark = Color(0xFF0D0D0D);
      const accent = Color(0xFFFF2D78);
      return Container(
        color: dark,
        child: Stack(
          children: [
            // Bottom diagonal fill
            ClipPath(
              clipper: _DiagonalClipper(),
              child: Container(color: accent),
            ),
            // Hours — top half, left
            Positioned(
              top: c.maxHeight * 0.1,
              left: c.maxWidth * 0.07,
              child: Text(
                h,
                style: GoogleFonts.bebasNeue(
                  fontSize: c.maxHeight * 0.32,
                  color: Colors.white,
                  height: 1,
                ),
              ),
            ),
            // Minutes — bottom half, right
            Positioned(
              bottom: c.maxHeight * 0.08,
              right: c.maxWidth * 0.07,
              child: Text(
                m,
                style: GoogleFonts.bebasNeue(
                  fontSize: c.maxHeight * 0.32,
                  color: dark,
                  height: 1,
                ),
              ),
            ),
            // Seconds & date center
            Positioned.fill(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      s,
                      style: GoogleFonts.bebasNeue(
                        fontSize: c.maxWidth * 0.1,
                        color: Colors.white.op(0.9),
                        letterSpacing: 4,
                      ),
                    ),
                    Text(
                      date,
                      style: GoogleFonts.robotoMono(
                        fontSize: c.maxWidth * 0.028,
                        color: Colors.white.op(0.7),
                        letterSpacing: 3,
                      ),
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

class _DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height * 0.6);
    path.lineTo(size.width, size.height * 0.4);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(_DiagonalClipper oldClipper) => false;
}
