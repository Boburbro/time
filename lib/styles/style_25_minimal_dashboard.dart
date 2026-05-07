import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;
import '../utils/extensions.dart';
import 'clock_style.dart';

ClockStyle getMinimalDashboardStyle() {
  return ClockStyle(
    build: (time, c) {
      final h = DateFormat('HH').format(time);
      final m = DateFormat('mm').format(time);
      final s = DateFormat('ss').format(time);
      final date = DateFormat('EEEE, d MMM').format(time);
      const bg = Color(0xFF14161A);
      const accent = Color(0xFF3B82F6);
      const text = Color(0xFFE2E8F0);
      final minDim = math.min(c.maxWidth, c.maxHeight);
      
      return Container(
        color: bg,
        child: Padding(
          padding: EdgeInsets.all(minDim * 0.08),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Top bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'SYSTEM / CLOCK',
                    style: GoogleFonts.inter(
                      fontSize: minDim * 0.04,
                      color: text.op(0.4),
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,
                    ),
                  ),
                  Icon(Icons.dashboard_customize, color: text.op(0.4), size: minDim * 0.05),
                ],
              ),
              // Center time rings
              SizedBox(
                width: minDim * 0.6,
                height: minDim * 0.6,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Outer ring (seconds)
                    CircularProgressIndicator(
                      value: time.second / 60,
                      strokeWidth: 2,
                      color: accent,
                      backgroundColor: text.op(0.05),
                    ),
                    // Inner content
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '$h:$m',
                          style: GoogleFonts.inter(
                            fontSize: minDim * 0.2,
                            color: text,
                            fontWeight: FontWeight.w200,
                            height: 1,
                          ),
                        ),
                        SizedBox(height: minDim * 0.02),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: accent.op(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            s,
                            style: GoogleFonts.inter(
                              fontSize: minDim * 0.05,
                              color: accent,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Bottom date
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: minDim * 0.03),
                decoration: BoxDecoration(
                  color: text.op(0.03),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    date,
                    style: GoogleFonts.inter(
                      fontSize: minDim * 0.05,
                      color: text.op(0.7),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
