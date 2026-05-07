import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/extensions.dart';
import 'clock_style.dart';

ClockStyle getNeonCityStyle() {
  return ClockStyle(
    build: (time, c) {
      final hm = DateFormat('HH:mm').format(time);
      final s = DateFormat('ss').format(time);
      final date = DateFormat('yyyy.MM.dd').format(time);
      const bg = Color(0xFF0F0014);
      const pink = Color(0xFFFF00FF);
      const cyan = Color(0xFF00FFFF);
      
      return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [bg, Color(0xFF2A0033)],
          ),
        ),
        child: Stack(
          children: [
            // Bottom grid lines
            ...List.generate(10, (i) {
              return Positioned(
                bottom: c.maxHeight * (i * 0.04),
                left: 0,
                right: 0,
                child: Container(height: 1, color: pink.op(0.2)),
              );
            }),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    hm,
                    style: GoogleFonts.monoton(
                      fontSize: c.maxWidth * 0.22,
                      color: cyan,
                      height: 1,
                      shadows: [
                        Shadow(blurRadius: 15, color: cyan),
                        Shadow(blurRadius: 30, color: cyan.op(0.5)),
                      ],
                    ),
                  ),
                  SizedBox(height: c.maxHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        date,
                        style: GoogleFonts.vt323(
                          fontSize: c.maxWidth * 0.06,
                          color: pink,
                          shadows: [Shadow(blurRadius: 10, color: pink)],
                        ),
                      ),
                      SizedBox(width: c.maxWidth * 0.05),
                      Text(
                        s,
                        style: GoogleFonts.vt323(
                          fontSize: c.maxWidth * 0.08,
                          color: Colors.white,
                          shadows: [Shadow(blurRadius: 10, color: Colors.white)],
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
