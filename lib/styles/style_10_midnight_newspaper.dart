import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/extensions.dart';
import 'clock_style.dart';

ClockStyle getMidnightNewspaperStyle() {
  return ClockStyle(
    build: (time, c) {
      final h = DateFormat('HH').format(time);
      final m = DateFormat('mm').format(time);
      final s = DateFormat('ss').format(time);
      final weekday = DateFormat('EEEE').format(time).toUpperCase();
      final date = DateFormat('MMMM d, yyyy').format(time).toUpperCase();
      const bg = Color(0xFF121212);
      const cream = Color(0xFFF0E6D3);
      return Container(
        color: bg,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: c.maxWidth * 0.07),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Divider top
              Row(
                children: [
                  Expanded(child: Container(height: 3, color: cream)),
                  SizedBox(width: c.maxWidth * 0.03),
                  Expanded(child: Container(height: 1, color: cream)),
                ],
              ),
              SizedBox(height: c.maxHeight * 0.02),
              Text(
                weekday,
                style: GoogleFonts.playfairDisplay(
                  fontSize: c.maxWidth * 0.05,
                  letterSpacing: 8,
                  color: cream.op(0.4),
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: c.maxHeight * 0.005),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    h,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: c.maxHeight * 0.3,
                      fontWeight: FontWeight.w900,
                      color: cream,
                      height: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: c.maxHeight * 0.02),
                    child: Text(
                      ':',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: c.maxHeight * 0.15,
                        fontWeight: FontWeight.w900,
                        color: cream.op(0.3),
                        height: 1,
                      ),
                    ),
                  ),
                  Text(
                    m,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: c.maxHeight * 0.3,
                      fontWeight: FontWeight.w900,
                      color: cream,
                      height: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: c.maxHeight * 0.025,
                      left: c.maxWidth * 0.02,
                    ),
                    child: Text(
                      s,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: c.maxHeight * 0.07,
                        color: cream.op(0.35),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: c.maxHeight * 0.01),
              Container(height: 1, color: cream.op(0.2)),
              SizedBox(height: c.maxHeight * 0.015),
              Text(
                date,
                style: GoogleFonts.robotoMono(
                  fontSize: c.maxWidth * 0.028,
                  color: cream.op(0.35),
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
