import 'package:flutter/material.dart';

import '../../theme/qahwa_colors.dart';

/// Large, very faint coffee beans scattered over the white background.
class BeansBackground extends StatelessWidget {
  const BeansBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomPaint(painter: _BeansPainter());
  }
}

class _BeansPainter extends CustomPainter {
  const _BeansPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final fill = Paint()..color = QahwaColors.beigeLight.withValues(alpha: 0.7);
    final seam = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    for (final (x, y, s, a) in const [
      (0.92, 0.07, 90.0, 0.6),
      (0.1, 0.3, 70.0, -0.4),
      (0.8, 0.27, 60.0, 0.9),
    ]) {
      canvas.save();
      canvas.translate(size.width * x, size.height * y);
      canvas.rotate(a);
      canvas.drawOval(
        Rect.fromCenter(center: Offset.zero, width: s, height: s * 1.4),
        fill,
      );
      canvas.drawPath(
        Path()
          ..moveTo(0, -s * 0.6)
          ..quadraticBezierTo(s * 0.2, 0, 0, s * 0.6),
        seam,
      );
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
