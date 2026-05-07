import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;
import '../utils/extensions.dart';
import 'clock_style.dart';

ClockStyle getCleanLinesStyle() {
  return ClockStyle(
    build: (time, c) {
      final h = DateFormat('HH').format(time);
      final m = DateFormat('mm').format(time);
      final s = DateFormat('ss').format(time);
      final date = DateFormat('EEEE, d MMM').format(time).toUpperCase();
      final minDim = math.min(c.maxWidth, c.maxHeight);
      
      const bg = Color(0xFF121212);
      const accent = Color(0xFFEEEEEE);
      
      return Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(color: bg),
        child: Padding(
          padding: EdgeInsets.all(minDim * 0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                h,
                style: GoogleFonts.poppins(
                  fontSize: minDim * 0.25,
                  fontWeight: FontWeight.w700,
                  color: accent,
                  height: 1,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: minDim * 0.01),
                width: minDim * 0.5,
                height: 4,
                color: accent,
              ),
              Text(
                m,
                style: GoogleFonts.poppins(
                  fontSize: minDim * 0.25,
                  fontWeight: FontWeight.w300,
                  color: accent.op(0.7),
                  height: 1,
                ),
              ),
              SizedBox(height: minDim * 0.04),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: minDim * 0.03, vertical: minDim * 0.01),
                    decoration: BoxDecoration(
                      border: Border.all(color: accent.op(0.5)),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      s,
                      style: GoogleFonts.poppins(
                        fontSize: minDim * 0.04,
                        fontWeight: FontWeight.w500,
                        color: accent.op(0.8),
                      ),
                    ),
                  ),
                  SizedBox(width: minDim * 0.04),
                  Text(
                    date,
                    style: GoogleFonts.poppins(
                      fontSize: minDim * 0.035,
                      fontWeight: FontWeight.w400,
                      color: accent.op(0.5),
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
