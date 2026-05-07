import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;
import '../utils/extensions.dart';
import 'clock_style.dart';

ClockStyle getPureMinimalStyle() {
  return ClockStyle(
    build: (time, c) {
      final hm = DateFormat('HH:mm').format(time);
      final s = DateFormat('ss').format(time);
      final date = DateFormat('EEEE, d MMMM').format(time);
      final minDim = math.min(c.maxWidth, c.maxHeight);
      
      const bg = Color(0xFFE5E5E5);
      const text = Color(0xFF1A1A1A);
      
      return Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(color: bg),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    hm,
                    style: GoogleFonts.inter(
                      fontSize: minDim * 0.25,
                      fontWeight: FontWeight.w300,
                      color: text,
                      height: 1,
                      letterSpacing: -2,
                    ),
                  ),
                  SizedBox(width: minDim * 0.02),
                  Text(
                    s,
                    style: GoogleFonts.inter(
                      fontSize: minDim * 0.06,
                      fontWeight: FontWeight.w300,
                      color: text.op(0.5),
                    ),
                  ),
                ],
              ),
              SizedBox(height: minDim * 0.02),
              Container(
                width: minDim * 0.4,
                height: 1,
                color: text.op(0.2),
              ),
              SizedBox(height: minDim * 0.03),
              Text(
                date.toUpperCase(),
                style: GoogleFonts.inter(
                  fontSize: minDim * 0.035,
                  fontWeight: FontWeight.w500,
                  color: text.op(0.6),
                  letterSpacing: 4,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
