import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/extensions.dart';
import 'clock_style.dart';

ClockStyle getNeonTerminalStyle() {
  return ClockStyle(
    build: (time, c) {
      final hm = DateFormat('HH:mm').format(time);
      final s = DateFormat('ss').format(time);
      final date = DateFormat('yyyy-MM-dd').format(time);
      const green = Color(0xFF39FF14);
      return Container(
        color: const Color(0xFF000000),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: c.maxWidth * 0.08),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '> SYS.TIME',
                style: GoogleFonts.shareTechMono(
                  fontSize: c.maxWidth * 0.035,
                  color: green.op(0.5),
                  letterSpacing: 2,
                ),
              ),
              SizedBox(height: c.maxHeight * 0.01),
              Text(
                hm,
                style: GoogleFonts.shareTechMono(
                  fontSize: c.maxWidth * 0.22,
                  color: green,
                  height: 1,
                  shadows: [Shadow(blurRadius: 20, color: green.op(0.6))],
                ),
              ),
              Row(
                children: [
                  Text(
                    ':$s',
                    style: GoogleFonts.shareTechMono(
                      fontSize: c.maxWidth * 0.08,
                      color: green.op(0.7),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '█',
                    style: GoogleFonts.shareTechMono(
                      fontSize: c.maxWidth * 0.05,
                      color: green,
                    ),
                  ),
                ],
              ),
              SizedBox(height: c.maxHeight * 0.03),
              Container(height: 1, color: green.op(0.3)),
              SizedBox(height: c.maxHeight * 0.015),
              Text(
                date,
                style: GoogleFonts.shareTechMono(
                  fontSize: c.maxWidth * 0.035,
                  color: green.op(0.5),
                  letterSpacing: 3,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
