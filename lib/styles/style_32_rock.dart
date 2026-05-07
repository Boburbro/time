import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;
import '../utils/extensions.dart';
import 'clock_style.dart';

ClockStyle getRockStyle() {
  return ClockStyle(
    build: (time, c) {
      final hm = DateFormat('HH:mm').format(time);
      final s = DateFormat('ss').format(time);
      final date = DateFormat('MMM d, yyyy').format(time).toUpperCase();
      
      const stoneBase = Color(0xFF37474F);
      const chiseledDark = Color(0xFF263238);
      const chiseledLight = Color(0xFF78909C);

      return Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.5,
            colors: [Color(0xFF546E7A), Color(0xFF263238)],
          ),
        ),
        child: Stack(
          children: [
            // Rock Texture overlay
            Positioned.fill(
              child: Opacity(
                opacity: 0.3,
                child: CustomPaint(
                  painter: _RockTexturePainter(),
                ),
              ),
            ),
            
            // Content
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    hm,
                    style: GoogleFonts.rubikDirt(
                      fontSize: c.maxWidth * 0.28,
                      color: stoneBase,
                      height: 1,
                      shadows: [
                        Shadow(color: chiseledDark, offset: const Offset(4, 4), blurRadius: 4),
                        Shadow(color: chiseledLight, offset: const Offset(-2, -2), blurRadius: 2),
                      ],
                    ),
                  ),
                  SizedBox(height: c.maxHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        date,
                        style: GoogleFonts.rockSalt(
                          fontSize: c.maxWidth * 0.035,
                          color: stoneBase,
                          shadows: [
                            Shadow(color: chiseledDark, offset: const Offset(2, 2), blurRadius: 2),
                            Shadow(color: chiseledLight, offset: const Offset(-1, -1), blurRadius: 1),
                          ],
                        ),
                      ),
                      SizedBox(width: c.maxWidth * 0.06),
                      Text(
                        s,
                        style: GoogleFonts.rubikDirt(
                          fontSize: c.maxWidth * 0.08,
                          color: stoneBase,
                          shadows: [
                            Shadow(color: chiseledDark, offset: const Offset(2, 2), blurRadius: 2),
                            Shadow(color: chiseledLight, offset: const Offset(-1, -1), blurRadius: 1),
                          ],
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

class _RockTexturePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintDark = Paint()
      ..color = Colors.black.op(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;
      
    final paintLight = Paint()
      ..color = Colors.white.op(0.2)
      ..style = PaintingStyle.fill;

    final random = math.Random(777);

    // Draw random jagged cracks
    for (int i = 0; i < 20; i++) {
      final path = Path();
      double x = random.nextDouble() * size.width;
      double y = random.nextDouble() * size.height;
      path.moveTo(x, y);
      
      for (int j = 0; j < 5; j++) {
        x += (random.nextDouble() - 0.5) * 100;
        y += (random.nextDouble() - 0.5) * 100;
        path.lineTo(x, y);
      }
      canvas.drawPath(path, paintDark);
    }
    
    // Draw some noise specks
    for (int i = 0; i < 200; i++) {
      canvas.drawCircle(
        Offset(random.nextDouble() * size.width, random.nextDouble() * size.height),
        random.nextDouble() * 3,
        random.nextBool() ? paintDark : paintLight,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _RockTexturePainter oldDelegate) => false;
}
