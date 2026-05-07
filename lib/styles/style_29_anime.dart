import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;
import 'clock_style.dart';

ClockStyle getAnimeStyle() {
  return ClockStyle(
    build: (time, c) {
      final hm = DateFormat('HH:mm').format(time);
      final s = DateFormat('ss').format(time);
      final day = DateFormat('EEEE').format(time).toUpperCase();
      
      const orange = Color(0xFFFF5E00);
      const yellow = Color(0xFFFFD500);
      const black = Color(0xFF1A1A1A);
      const white = Colors.white;

      return Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(color: orange),
        child: Stack(
          children: [
            // Action lines background (Sunburst)
            Positioned.fill(
              child: CustomPaint(
                painter: _SunburstPainter(color: yellow),
              ),
            ),
            
            // Halftone/Dots overlay simulation
            Positioned.fill(
              child: Opacity(
                opacity: 0.1,
                child: CustomPaint(
                  painter: _HalftonePainter(),
                ),
              ),
            ),

            // Content
            Center(
              child: Transform.rotate(
                angle: -5 * math.pi / 180, // slight dramatic tilt
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Day of week in dramatic box
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      decoration: BoxDecoration(
                        color: black,
                        border: Border.all(color: white, width: 3),
                        boxShadow: const [
                          BoxShadow(color: black, offset: Offset(4, 4))
                        ],
                      ),
                      child: Text(
                        'DAY: $day!',
                        style: GoogleFonts.bangers(
                          fontSize: c.maxWidth * 0.05,
                          color: white,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                    SizedBox(height: c.maxHeight * 0.02),
                    
                    // Huge Time with thick stroke effect
                    Stack(
                      children: [
                        // Stroke / Shadow
                        Text(
                          hm,
                          style: GoogleFonts.bangers(
                            fontSize: c.maxWidth * 0.25,
                            color: black,
                            height: 1,
                          ),
                        ),
                        // Inner fill
                        Text(
                          hm,
                          style: GoogleFonts.bangers(
                            fontSize: c.maxWidth * 0.25,
                            color: white,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                    
                    // Seconds badge
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: c.maxWidth * 0.1),
                        child: Container(
                          width: c.maxWidth * 0.12,
                          height: c.maxWidth * 0.12,
                          decoration: const BoxDecoration(
                            color: yellow,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(color: black, offset: Offset(4, 4))
                            ],
                          ),
                          child: Center(
                            child: Text(
                              s,
                              style: GoogleFonts.bangers(
                                fontSize: c.maxWidth * 0.06,
                                color: black,
                              ),
                            ),
                          ),
                        ),
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

class _SunburstPainter extends CustomPainter {
  final Color color;
  _SunburstPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.sqrt(size.width * size.width + size.height * size.height);
    
    const int rayCount = 16;
    const double angleStep = (2 * math.pi) / rayCount;

    for (int i = 0; i < rayCount; i += 2) {
      final path = Path()
        ..moveTo(center.dx, center.dy)
        ..lineTo(
          center.dx + radius * math.cos(i * angleStep),
          center.dy + radius * math.sin(i * angleStep),
        )
        ..lineTo(
          center.dx + radius * math.cos((i + 1) * angleStep),
          center.dy + radius * math.sin((i + 1) * angleStep),
        )
        ..close();
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _SunburstPainter oldDelegate) => oldDelegate.color != color;
}

class _HalftonePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black;
    const double spacing = 12.0;
    
    for (double y = 0; y < size.height; y += spacing) {
      for (double x = 0; x < size.width; x += spacing) {
        canvas.drawCircle(Offset(x, y), 2, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _HalftonePainter oldDelegate) => false;
}
