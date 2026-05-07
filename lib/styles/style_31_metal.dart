import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;
import '../utils/extensions.dart';
import 'clock_style.dart';

ClockStyle getMetalStyle() {
  return ClockStyle(
    build: (time, c) {
      final hm = DateFormat('HH:mm').format(time);
      final s = DateFormat('ss').format(time);
      final date = DateFormat('yyyy.MM.dd').format(time);
      
      const steelDark = Color(0xFF757F8A);
      const steelLight = Color(0xFFB0BEC5);
      const textMetal = Color(0xFF455A64);
      final minDim = math.min(c.maxWidth, c.maxHeight);

      return Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.1, 0.3, 0.5, 0.7, 0.9],
            colors: [
              steelDark,
              steelLight,
              steelDark,
              steelLight,
              steelDark,
            ],
          ),
        ),
        child: Stack(
          children: [
            // Brushed metal lines
            Positioned.fill(
              child: Opacity(
                opacity: 0.15,
                child: CustomPaint(
                  painter: _BrushedMetalPainter(),
                ),
              ),
            ),
            
            // Four Rivets in corners
            Positioned(top: minDim * 0.08, left: minDim * 0.08, child: _buildRivet(minDim * 0.06)),
            Positioned(top: minDim * 0.08, right: minDim * 0.08, child: _buildRivet(minDim * 0.06)),
            Positioned(bottom: minDim * 0.08, left: minDim * 0.08, child: _buildRivet(minDim * 0.06)),
            Positioned(bottom: minDim * 0.08, right: minDim * 0.08, child: _buildRivet(minDim * 0.06)),

            // Content
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: minDim * 0.05,
                  horizontal: minDim * 0.1,
                ),
                decoration: BoxDecoration(
                  color: steelDark.op(0.3),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.white.op(0.3), width: 1),
                  boxShadow: [
                    BoxShadow(color: Colors.black.op(0.3), blurRadius: 10, offset: const Offset(4, 4)),
                    BoxShadow(color: Colors.white.op(0.3), blurRadius: 10, offset: const Offset(-4, -4)),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      hm,
                      style: GoogleFonts.blackOpsOne(
                        fontSize: minDim * 0.22,
                        color: textMetal,
                        height: 1,
                        shadows: [
                          Shadow(color: Colors.white.op(0.8), offset: const Offset(-2, -2), blurRadius: 2),
                          Shadow(color: Colors.black.op(0.8), offset: const Offset(2, 2), blurRadius: 2),
                        ],
                      ),
                    ),
                    SizedBox(height: minDim * 0.02),
                    Text(
                      s,
                      style: GoogleFonts.blackOpsOne(
                        fontSize: minDim * 0.08,
                        color: textMetal,
                        shadows: [
                          Shadow(color: Colors.white.op(0.6), offset: const Offset(-1, -1), blurRadius: 1),
                          Shadow(color: Colors.black.op(0.6), offset: const Offset(1, 1), blurRadius: 1),
                        ],
                      ),
                    ),
                    SizedBox(height: minDim * 0.04),
                    Text(
                      date,
                      style: GoogleFonts.teko(
                        fontSize: minDim * 0.06,
                        color: textMetal,
                        letterSpacing: 4,
                        shadows: [
                          Shadow(color: Colors.white.op(0.6), offset: const Offset(-1, -1), blurRadius: 1),
                          Shadow(color: Colors.black.op(0.6), offset: const Offset(1, 1), blurRadius: 1),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

Widget _buildRivet(double size) {
  return Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      gradient: const RadialGradient(
        colors: [Color(0xFFCFD8DC), Color(0xFF546E7A)],
      ),
      boxShadow: [
        BoxShadow(color: Colors.black.op(0.5), blurRadius: 4, offset: const Offset(2, 2)),
        BoxShadow(color: Colors.white.op(0.5), blurRadius: 4, offset: const Offset(-2, -2)),
      ],
    ),
    child: Center(
      child: Container(
        width: size * 0.4,
        height: size * 0.1,
        decoration: BoxDecoration(
          color: Colors.black.op(0.4),
          boxShadow: [
            BoxShadow(color: Colors.white.op(0.3), offset: const Offset(0, 1))
          ],
        ),
      ),
    ),
  );
}

class _BrushedMetalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 0.5;

    // Draw horizontal faint lines
    for (double y = 0; y < size.height; y += 4) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant _BrushedMetalPainter oldDelegate) => false;
}
