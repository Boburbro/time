import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/extensions.dart';
import 'clock_style.dart';

ClockStyle getGlitchStyle() {
  return ClockStyle(
    build: (time, c) {
      final hm = DateFormat('HH:mm').format(time);
      final s = DateFormat('ss').format(time);
      const bg = Color(0xFF111111);
      return Container(
        color: bg,
        child: Center(
          child: Stack(
            children: [
              // Red channel offset
              Transform.translate(
                offset: const Offset(-2, 0),
                child: Text(
                  hm,
                  style: GoogleFonts.robotoMono(
                    fontSize: c.maxWidth * 0.22,
                    color: Colors.red.op(0.6),
                  ),
                ),
              ),
              // Green channel offset
              Transform.translate(
                offset: const Offset(2, 0),
                child: Text(
                  hm,
                  style: GoogleFonts.robotoMono(
                    fontSize: c.maxWidth * 0.22,
                    color: Colors.green.op(0.6),
                  ),
                ),
              ),
              // Main white text
              Text(
                hm,
                style: GoogleFonts.robotoMono(
                  fontSize: c.maxWidth * 0.22,
                  color: Colors.white,
                ),
              ),
              // Seconds below with slight jitter
              Positioned(
                top: c.maxHeight * 0.55,
                left: 0,
                right: 0,
                child: Center(
                  child: Transform.translate(
                    offset: const Offset(1, -1),
                    child: Text(
                      s,
                      style: GoogleFonts.robotoMono(
                        fontSize: c.maxWidth * 0.07,
                        color: Colors.white70,
                      ),
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
