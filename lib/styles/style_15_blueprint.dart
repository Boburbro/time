import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/extensions.dart';
import 'clock_style.dart';

ClockStyle getBlueprintStyle() {
  return ClockStyle(
    build: (time, c) {
      final hm = DateFormat('HH:mm').format(time);
      final s = DateFormat('ss').format(time);
      final date = DateFormat('dd/MM/yyyy').format(time);
      final day = DateFormat('EEEE').format(time).toUpperCase();
      const bg = Color(0xFF0A3161);
      const line = Color(0xFF4A8FCC);
      const fg = Color(0xFFD4E9FF);
      return Container(
        color: bg,
        child: Stack(
          children: [
            // Grid lines — vertical
            ...List.generate(8, (i) {
              return Positioned(
                left: c.maxWidth * (i + 1) / 9,
                top: 0,
                bottom: 0,
                child: Container(width: 0.5, color: line.op(0.15)),
              );
            }),
            // Grid lines — horizontal
            ...List.generate(12, (i) {
              return Positioned(
                top: c.maxHeight * (i + 1) / 13,
                left: 0,
                right: 0,
                child: Container(height: 0.5, color: line.op(0.15)),
              );
            }),
            // Cross-hair center
            Positioned(
              top: c.maxHeight * 0.5 - 20,
              left: c.maxWidth * 0.5 - 20,
              child: SizedBox(
                width: 40,
                height: 40,
                child: Stack(
                  children: [
                    Positioned(
                      top: 19,
                      left: 0,
                      right: 0,
                      child: Container(height: 1, color: line.op(0.4)),
                    ),
                    Positioned(
                      left: 19,
                      top: 0,
                      bottom: 0,
                      child: Container(width: 1, color: line.op(0.4)),
                    ),
                  ],
                ),
              ),
            ),
            // Title block — bottom right
            Positioned(
              bottom: c.maxHeight * 0.04,
              right: c.maxWidth * 0.04,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: c.maxWidth * 0.04,
                  vertical: c.maxHeight * 0.015,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: line.op(0.4), width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'DWG: CLOCK-01',
                      style: GoogleFonts.robotoMono(
                        fontSize: c.maxWidth * 0.022,
                        color: fg.op(0.4),
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(height: c.maxHeight * 0.005),
                    Text(
                      '$date  REV.$s',
                      style: GoogleFonts.robotoMono(
                        fontSize: c.maxWidth * 0.02,
                        color: fg.op(0.35),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Time — center
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    day,
                    style: GoogleFonts.robotoMono(
                      fontSize: c.maxWidth * 0.03,
                      color: fg.op(0.4),
                      letterSpacing: 6,
                    ),
                  ),
                  SizedBox(height: c.maxHeight * 0.02),
                  Text(
                    hm,
                    style: GoogleFonts.robotoMono(
                      fontSize: c.maxWidth * 0.2,
                      fontWeight: FontWeight.w100,
                      color: fg,
                      height: 1,
                    ),
                  ),
                  Text(
                    ':$s',
                    style: GoogleFonts.robotoMono(
                      fontSize: c.maxWidth * 0.06,
                      color: fg.op(0.4),
                    ),
                  ),
                ],
              ),
            ),
            // Dimension arrow — top
            Positioned(
              top: c.maxHeight * 0.06,
              left: c.maxWidth * 0.15,
              right: c.maxWidth * 0.15,
              child: Row(
                children: [
                  Text(
                    '◁',
                    style: TextStyle(color: line.op(0.3), fontSize: 10),
                  ),
                  Expanded(
                    child: Container(height: 0.5, color: line.op(0.3)),
                  ),
                  Text(
                    '▷',
                    style: TextStyle(color: line.op(0.3), fontSize: 10),
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
