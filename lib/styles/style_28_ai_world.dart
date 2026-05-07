import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;
import '../utils/extensions.dart';
import 'clock_style.dart';

ClockStyle getAiWorldStyle() {
  return ClockStyle(
    build: (time, c) {
      final hm = DateFormat('HH:mm').format(time);
      final s = DateFormat('ss').format(time);
      final date = DateFormat('yyyy.MM.dd').format(time);
      const bg = Color(0xFF070B19);
      const nodeColor = Color(0xFF00E5FF); // Cyan
      const lineColor = Color(0xFF00E5FF);
      final minDim = math.min(c.maxWidth, c.maxHeight);

      return Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(color: bg),
        child: Stack(
          children: [
            // Abstract Neural Network / Node Connections
            Positioned.fill(
              child: CustomPaint(
                painter: _AiNetworkPainter(
                  color: lineColor.op(0.15),
                  time: time.second + time.minute * 60.0,
                ),
              ),
            ),
            
            // Central Data Hub (Time)
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Glowing rings
                  Container(
                    width: minDim * 0.7,
                    height: minDim * 0.7,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: nodeColor.op(0.1), width: 1),
                    ),
                  ),
                  Container(
                    width: minDim * 0.55,
                    height: minDim * 0.55,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: nodeColor.op(0.2), width: 2),
                    ),
                  ),
                  
                  // Orbiting nodes (seconds)
                  Transform.rotate(
                    angle: time.second * 6 * math.pi / 180,
                    child: Container(
                      width: minDim * 0.55,
                      height: minDim * 0.55,
                      alignment: Alignment.topCenter,
                      child: Transform.translate(
                        offset: const Offset(0, -6),
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: nodeColor,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(color: nodeColor, blurRadius: 10, spreadRadius: 2)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Core content
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'SYS.AI.ACT',
                        style: GoogleFonts.rajdhani(
                          fontSize: minDim * 0.04,
                          fontWeight: FontWeight.bold,
                          color: nodeColor.op(0.7),
                          letterSpacing: 4,
                        ),
                      ),
                      SizedBox(height: minDim * 0.01),
                      Text(
                        hm,
                        style: GoogleFonts.rajdhani(
                          fontSize: minDim * 0.22,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          height: 1,
                          shadows: [
                            Shadow(color: nodeColor.op(0.5), blurRadius: 20)
                          ],
                        ),
                      ),
                      Text(
                        s,
                        style: GoogleFonts.rajdhani(
                          fontSize: minDim * 0.06,
                          fontWeight: FontWeight.w400,
                          color: nodeColor,
                        ),
                      ),
                      SizedBox(height: minDim * 0.02),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        decoration: BoxDecoration(
                          color: nodeColor.op(0.1),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: nodeColor.op(0.3)),
                        ),
                        child: Text(
                          date,
                          style: GoogleFonts.rajdhani(
                            fontSize: minDim * 0.04,
                            fontWeight: FontWeight.w500,
                            color: Colors.white.op(0.8),
                          ),
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

class _AiNetworkPainter extends CustomPainter {
  final Color color;
  final double time;

  _AiNetworkPainter({required this.color, required this.time});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;
      
    final dotPaint = Paint()..color = color.op(1.0);

    final random = math.Random(42); // fixed seed for static nodes
    final List<Offset> nodes = [];
    
    // Generate nodes
    for (int i = 0; i < 30; i++) {
      nodes.add(Offset(
        random.nextDouble() * size.width,
        random.nextDouble() * size.height,
      ));
    }

    // Draw connections
    for (int i = 0; i < nodes.length; i++) {
      for (int j = i + 1; j < nodes.length; j++) {
        final dist = (nodes[i] - nodes[j]).distance;
        if (dist < size.width * 0.3) {
          canvas.drawLine(nodes[i], nodes[j], paint);
        }
      }
      // Draw node
      canvas.drawCircle(nodes[i], 2, dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _AiNetworkPainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.time != time;
  }
}
