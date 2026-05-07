import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;
import '../utils/extensions.dart';
import 'clock_style.dart';

ClockStyle getOldClassicStyle() {
  return ClockStyle(
    build: (time, c) {
      final date = DateFormat('MMM d, yyyy').format(time);
      const wood = Color(0xFF3E2723);
      const gold = Color(0xFFD4AF37);
      const face = Color(0xFFFFF8E7); // Ivory
      const ink = Color(0xFF1F1A17);
      final minDim = math.min(c.maxWidth, c.maxHeight);

      return Container(
        color: wood,
        child: Stack(
          children: [
            // Inner shadow for depth
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    radius: 1.2,
                    colors: [Colors.transparent, Colors.black.op(0.6)],
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Analog Clock Face
                  Container(
                    width: minDim * 0.7,
                    height: minDim * 0.7,
                    decoration: BoxDecoration(
                      color: face,
                      shape: BoxShape.circle,
                      border: Border.all(color: gold, width: 8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.op(0.5),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                        // Inner bevel
                        BoxShadow(
                          color: Colors.black.op(0.2),
                          blurRadius: 10,
                          spreadRadius: -5,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Roman Numerals
                        for (int i = 1; i <= 12; i++)
                          Transform.rotate(
                            angle: i * 30 * math.pi / 180,
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: EdgeInsets.only(top: minDim * 0.04),
                                child: Transform.rotate(
                                  angle: -i * 30 * math.pi / 180,
                                  child: Text(
                                    _toRoman(i),
                                    style: GoogleFonts.cinzel(
                                      fontSize: minDim * 0.06,
                                      fontWeight: FontWeight.bold,
                                      color: ink,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        
                        // Brand/Logo area
                        Positioned(
                          top: minDim * 0.18,
                          child: Text(
                            'EST. 1894',
                            style: GoogleFonts.cormorantGaramond(
                              fontSize: minDim * 0.03,
                              color: ink.op(0.5),
                              letterSpacing: 2,
                            ),
                          ),
                        ),

                        // Hour Hand
                        Transform.rotate(
                          angle: (time.hour % 12 + time.minute / 60) * 30 * math.pi / 180,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: EdgeInsets.only(top: minDim * 0.15),
                              child: _buildHand(minDim * 0.02, minDim * 0.22, ink),
                            ),
                          ),
                        ),

                        // Minute Hand
                        Transform.rotate(
                          angle: time.minute * 6 * math.pi / 180,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: EdgeInsets.only(top: minDim * 0.08),
                              child: _buildHand(minDim * 0.015, minDim * 0.29, ink),
                            ),
                          ),
                        ),

                        // Second Hand
                        Transform.rotate(
                          angle: time.second * 6 * math.pi / 180,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: EdgeInsets.only(top: minDim * 0.05),
                              child: _buildHand(minDim * 0.006, minDim * 0.35, const Color(0xFF8B0000)),
                            ),
                          ),
                        ),

                        // Center Pin
                        Container(
                          width: minDim * 0.04,
                          height: minDim * 0.04,
                          decoration: const BoxDecoration(
                            color: gold,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: minDim * 0.06),
                  // Date Plaque
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: minDim * 0.015,
                      horizontal: minDim * 0.06,
                    ),
                    decoration: BoxDecoration(
                      color: gold.op(0.2),
                      border: Border.all(color: gold, width: 2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      date,
                      style: GoogleFonts.cinzel(
                        fontSize: minDim * 0.04,
                        fontWeight: FontWeight.w700,
                        color: gold,
                        letterSpacing: 2,
                      ),
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

Widget _buildHand(double width, double height, Color color) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(width / 2),
      boxShadow: [
        BoxShadow(
          color: Colors.black.op(0.3),
          blurRadius: 4,
          offset: const Offset(2, 2),
        ),
      ],
    ),
  );
}

String _toRoman(int number) {
  const roman = ['I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX', 'X', 'XI', 'XII'];
  return roman[number - 1];
}
