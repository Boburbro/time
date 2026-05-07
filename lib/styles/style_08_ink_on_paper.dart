import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/extensions.dart';
import 'clock_style.dart';

ClockStyle getInkOnPaperStyle() {
  return ClockStyle(
    build: (time, c) {
      final h = DateFormat('HH').format(time);
      final m = DateFormat('mm').format(time);
      final s = DateFormat('ss').format(time);
      final date = DateFormat('EEEE  ·  d MMMM').format(time);
      const paper = Color(0xFFF2E8D5);
      const ink = Color(0xFF1C1008);
      return Container(
        color: paper,
        child: Stack(
          children: [
            // Subtle texture lines
            Positioned.fill(
              child: Column(
                children: List.generate(
                  30,
                  (i) => Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: ink.op(0.04), width: 0.5),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Content
            Padding(
              padding: EdgeInsets.only(
                left: c.maxWidth * 0.1,
                right: c.maxWidth * 0.08,
                top: c.maxHeight * 0.12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '$h:$m',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: c.maxWidth * 0.2,
                          fontWeight: FontWeight.w900,
                          color: ink,
                          height: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: c.maxWidth * 0.02,
                          left: c.maxWidth * 0.02,
                        ),
                        child: Text(
                          s,
                          style: GoogleFonts.playfairDisplay(
                            fontSize: c.maxWidth * 0.07,
                            color: ink.op(0.4),
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: c.maxHeight * 0.04),
                  Container(
                    width: c.maxWidth * 0.6,
                    height: 1.5,
                    color: ink.op(0.25),
                  ),
                  SizedBox(height: c.maxHeight * 0.025),
                  Text(
                    date,
                    style: GoogleFonts.dancingScript(
                      fontSize: c.maxWidth * 0.065,
                      color: ink.op(0.6),
                    ),
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
