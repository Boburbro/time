import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/extensions.dart';
import 'clock_style.dart';

ClockStyle getRetroFlipClockStyle() {
  return ClockStyle(
    build: (time, c) {
      final h = DateFormat('HH').format(time);
      final m = DateFormat('mm').format(time);
      final date = DateFormat('EEE, d MMM').format(time).toUpperCase();
      const bg = Color(0xFF1E1E1E);
      const cardBg = Color(0xFFEBEBEB);
      const textCol = Color(0xFF121212);
      
      Widget buildCard(String text, BoxConstraints c) {
        return Container(
          width: c.maxWidth * 0.35,
          height: c.maxHeight * 0.35,
          decoration: BoxDecoration(
            color: cardBg,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.op(0.5),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                text,
                style: GoogleFonts.oswald(
                  fontSize: c.maxHeight * 0.28,
                  fontWeight: FontWeight.w700,
                  color: textCol,
                  height: 1.1,
                ),
              ),
              // The horizontal "flip" split line
              Container(
                height: 2,
                width: double.infinity,
                color: Colors.black.op(0.3),
              ),
            ],
          ),
        );
      }

      return Container(
        color: bg,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildCard(h, c),
                  SizedBox(width: c.maxWidth * 0.05),
                  buildCard(m, c),
                ],
              ),
              SizedBox(height: c.maxHeight * 0.08),
              Text(
                date,
                style: GoogleFonts.oswald(
                  fontSize: c.maxWidth * 0.04,
                  color: cardBg.op(0.6),
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
