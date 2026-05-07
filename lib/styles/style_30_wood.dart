import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;
import '../utils/extensions.dart';
import 'clock_style.dart';

ClockStyle getWoodStyle() {
  return ClockStyle(
    build: (time, c) {
      final hm = DateFormat('HH:mm').format(time);
      final s = DateFormat('ss').format(time);
      final date = DateFormat('EEEE, MMMM d').format(time);
      
      const woodBase = Color(0xFF5D4037);
      const engraveColor = Color(0xFF3E2723);
      final minDim = math.min(c.maxWidth, c.maxHeight);

      return Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(color: woodBase),
        child: Stack(
          children: [
            // Wood grain texture
            Positioned.fill(
              child: CustomPaint(
                painter: _WoodGrainPainter(),
              ),
            ),
            
            // Plaque or carved area
            Center(
              child: Container(
                width: minDim * 0.85,
                padding: EdgeInsets.symmetric(
                  vertical: minDim * 0.08,
                  horizontal: minDim * 0.08,
                ),
                decoration: BoxDecoration(
                  color: woodBase,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.op(0.6),
                      blurRadius: 10,
                      offset: const Offset(4, 4),
                    ),
                  ],
                  border: Border.all(color: Colors.black.op(0.5), width: 2),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      hm,
                      style: GoogleFonts.rye(
                        fontSize: minDim * 0.22,
                        color: engraveColor,
                        height: 1,
                        shadows: [
                          Shadow(color: Colors.black.op(0.8), offset: const Offset(1, 1), blurRadius: 2),
                          Shadow(color: Colors.white.op(0.2), offset: const Offset(-1, -1), blurRadius: 1),
                        ],
                      ),
                    ),
                    SizedBox(height: minDim * 0.02),
                    Text(
                      s,
                      style: GoogleFonts.rye(
                        fontSize: minDim * 0.08,
                        color: engraveColor.op(0.8),
                        shadows: [
                          Shadow(color: Colors.black.op(0.8), offset: const Offset(1, 1), blurRadius: 2),
                          Shadow(color: Colors.white.op(0.2), offset: const Offset(-1, -1), blurRadius: 1),
                        ],
                      ),
                    ),
                    SizedBox(height: minDim * 0.04),
                    Text(
                      date,
                      style: GoogleFonts.cormorantGaramond(
                        fontSize: minDim * 0.05,
                        fontWeight: FontWeight.w600,
                        color: engraveColor,
                        letterSpacing: 2,
                        shadows: [
                          Shadow(color: Colors.black.op(0.6), offset: const Offset(1, 1), blurRadius: 1),
                          Shadow(color: Colors.white.op(0.15), offset: const Offset(-1, -1), blurRadius: 1),
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

class _WoodGrainPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF4E342E).op(0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final random = math.Random(123);
    
    for (double i = 0; i < size.width * 1.5; i += 15 + random.nextDouble() * 10) {
      final path = Path();
      path.moveTo(i, 0);
      
      double x = i;
      for (double y = 0; y <= size.height; y += 40) {
        x += math.sin(y / 50.0 + i) * 10;
        path.lineTo(x, y);
      }
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _WoodGrainPainter oldDelegate) => false;
}
