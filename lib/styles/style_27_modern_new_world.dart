import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import 'dart:math' as math;
import '../utils/extensions.dart';
import 'clock_style.dart';

ClockStyle getModernNewWorldStyle() {
  return ClockStyle(
    build: (time, c) {
      final hm = DateFormat('HH:mm').format(time);
      final s = DateFormat('ss').format(time);
      final date = DateFormat('EEEE, d MMMM').format(time);
      const bg = Color(0xFFF3F4F6); // Soft gray
      const accent1 = Color(0xFF3B82F6); // Blue
      const accent2 = Color(0xFF8B5CF6); // Purple
      const accent3 = Color(0xFF10B981); // Emerald
      const textDark = Color(0xFF1F2937);
      final minDim = math.min(c.maxWidth, c.maxHeight);

      return Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(color: bg),
        child: Stack(
          children: [
            // Abstract floating blobs
            Positioned(
              top: -c.maxHeight * 0.1,
              left: -c.maxWidth * 0.2,
              child: Container(
                width: c.maxWidth * 0.8,
                height: c.maxWidth * 0.8,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: accent1,
                ),
              ),
            ),
            Positioned(
              bottom: c.maxHeight * 0.1,
              right: -c.maxWidth * 0.3,
              child: Container(
                width: c.maxWidth * 0.9,
                height: c.maxWidth * 0.9,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: accent2,
                ),
              ),
            ),
            Positioned(
              top: c.maxHeight * 0.4,
              left: c.maxWidth * 0.2,
              child: Container(
                width: c.maxWidth * 0.5,
                height: c.maxWidth * 0.5,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: accent3,
                ),
              ),
            ),

            // Glassmorphism Blur Layer
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 80.0, sigmaY: 80.0),
                child: Container(color: Colors.white.op(0.3)),
              ),
            ),

            // Content
            Center(
              child: Container(
                width: minDim * 0.85,
                padding: EdgeInsets.symmetric(
                  vertical: minDim * 0.08,
                  horizontal: minDim * 0.08,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.op(0.4),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white.op(0.6), width: 1.5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.op(0.05),
                      blurRadius: 30,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'NEW WORLD',
                      style: GoogleFonts.montserrat(
                        fontSize: minDim * 0.04,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 4,
                        color: accent1.op(0.8),
                      ),
                    ),
                    SizedBox(height: minDim * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          hm,
                          style: GoogleFonts.outfit(
                            fontSize: minDim * 0.22,
                            fontWeight: FontWeight.w200,
                            color: textDark,
                            height: 1,
                          ),
                        ),
                        SizedBox(width: minDim * 0.02),
                        Text(
                          s,
                          style: GoogleFonts.outfit(
                            fontSize: minDim * 0.08,
                            fontWeight: FontWeight.w600,
                            color: accent2,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: minDim * 0.03),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: minDim * 0.05,
                        vertical: minDim * 0.015,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.op(0.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        date,
                        style: GoogleFonts.montserrat(
                          fontSize: minDim * 0.04,
                          fontWeight: FontWeight.w500,
                          color: textDark.op(0.7),
                        ),
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
