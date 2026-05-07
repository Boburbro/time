import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/extensions.dart';
import 'clock_style.dart';

ClockStyle getVoidMinimalStyle() {
  return ClockStyle(
    build: (time, c) {
      final h = DateFormat('HH').format(time);
      final m = DateFormat('mm').format(time);
      final s = DateFormat('ss').format(time);
      final date = DateFormat('EEE · d MMM').format(time).toUpperCase();
      const bg = Color(0xFF000000);
      const fg = Color(0xFFFFFFFF);

      return Container(
        color: bg,
        child: Stack(
          children: [
            // ── Geometric decorations ──

            // Large circle — top right, hollow
            Positioned(
              top: -c.maxWidth * 0.15,
              right: -c.maxWidth * 0.15,
              child: Container(
                width: c.maxWidth * 0.6,
                height: c.maxWidth * 0.6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: fg.op(0.07), width: 1),
                ),
              ),
            ),

            // Small filled square — bottom left
            Positioned(
              bottom: c.maxHeight * 0.1,
              left: c.maxWidth * 0.07,
              child: Container(
                width: c.maxWidth * 0.04,
                height: c.maxWidth * 0.04,
                color: fg.op(0.12),
              ),
            ),

            // Thin horizontal line — upper area
            Positioned(
              top: c.maxHeight * 0.18,
              left: c.maxWidth * 0.07,
              child: Container(
                width: c.maxWidth * 0.12,
                height: 1,
                color: fg.op(0.2),
              ),
            ),

            // Medium circle outline — bottom right
            Positioned(
              bottom: -c.maxWidth * 0.08,
              right: c.maxWidth * 0.1,
              child: Container(
                width: c.maxWidth * 0.28,
                height: c.maxWidth * 0.28,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: fg.op(0.06), width: 1),
                ),
              ),
            ),

            // ── Content ──
            Padding(
              padding: EdgeInsets.symmetric(horizontal: c.maxWidth * 0.08),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Date — small, top
                  Text(
                    date,
                    style: GoogleFonts.robotoMono(
                      fontSize: c.maxWidth * 0.03,
                      color: fg.op(0.3),
                      letterSpacing: 3,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: c.maxHeight * 0.02),

                  // Hours — stretched tall
                  Transform.scale(
                    scaleY: 1.55,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      h,
                      style: GoogleFonts.bebasNeue(
                        fontSize: c.maxHeight * 0.28,
                        color: fg,
                        height: 1,
                      ),
                    ),
                  ),

                  // Minutes — slightly smaller, stretched
                  Transform.scale(
                    scaleY: 1.55,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      m,
                      style: GoogleFonts.bebasNeue(
                        fontSize: c.maxHeight * 0.28,
                        color: fg.op(0.15),
                        height: 1,
                      ),
                    ),
                  ),

                  SizedBox(height: c.maxHeight * 0.04),

                  // Seconds + thin line
                  Row(
                    children: [
                      Container(
                        width: c.maxWidth * 0.06,
                        height: 1,
                        color: fg.op(0.2),
                      ),
                      SizedBox(width: c.maxWidth * 0.03),
                      Text(
                        s,
                        style: GoogleFonts.robotoMono(
                          fontSize: c.maxWidth * 0.04,
                          color: fg.op(0.25),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
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
