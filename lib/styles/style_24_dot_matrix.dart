import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/extensions.dart';
import 'clock_style.dart';

ClockStyle getDotMatrixStyle() {
  return ClockStyle(
    build: (time, c) {
      final hm = DateFormat('HH:mm').format(time);
      final s = DateFormat('ss').format(time);
      final date = DateFormat('dd MMM yy').format(time).toUpperCase();
      const bg = Color(0xFF050505);
      const ledOn = Color(0xFFFF3300);
      const ledOff = Color(0xFF220000);
      
      return Container(
        color: bg,
        child: Stack(
          children: [
            // Simulate the unlit LED dots in the background
            Positioned.fill(
              child: CustomPaint(
                painter: _DotMatrixBackgroundPainter(color: ledOff, dotSize: 2.0, spacing: 6.0),
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: c.maxHeight * 0.05,
                  horizontal: c.maxWidth * 0.05,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: ledOn.op(0.3), width: 2),
                  borderRadius: BorderRadius.circular(8),
                  color: bg.op(0.8), // dim the background dots behind text
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          hm,
                          style: GoogleFonts.dotGothic16(
                            fontSize: c.maxWidth * 0.28,
                            color: ledOn,
                            height: 1,
                            shadows: [Shadow(blurRadius: 8, color: ledOn.op(0.8))],
                          ),
                        ),
                        SizedBox(width: c.maxWidth * 0.02),
                        Text(
                          s,
                          style: GoogleFonts.dotGothic16(
                            fontSize: c.maxWidth * 0.1,
                            color: ledOn.op(0.8),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: c.maxHeight * 0.02),
                    Text(
                      date,
                      style: GoogleFonts.dotGothic16(
                        fontSize: c.maxWidth * 0.06,
                        color: ledOn.op(0.9),
                        letterSpacing: 4,
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

class _DotMatrixBackgroundPainter extends CustomPainter {
  final Color color;
  final double dotSize;
  final double spacing;

  _DotMatrixBackgroundPainter({
    required this.color,
    required this.dotSize,
    required this.spacing,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    
    for (double y = 0; y < size.height; y += spacing) {
      for (double x = 0; x < size.width; x += spacing) {
        canvas.drawCircle(Offset(x, y), dotSize / 2, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DotMatrixBackgroundPainter oldDelegate) {
    return oldDelegate.color != color ||
           oldDelegate.dotSize != dotSize ||
           oldDelegate.spacing != spacing;
  }
}
