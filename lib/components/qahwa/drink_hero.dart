import 'package:flutter/material.dart';

import '../../theme/qahwa_colors.dart';

/// The frappuccino in a lighter green circle, like the product hero.
class DrinkHero extends StatelessWidget {
  const DrinkHero({super.key, this.size = 200, this.circleSize = 170});

  final double size;
  final double circleSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: circleSize,
            height: circleSize,
            decoration: const BoxDecoration(
              color: QahwaColors.greenLight,
              shape: BoxShape.circle,
            ),
          ),
          // Clip the cup's base to the circle; the cream pops out on top.
          Positioned.fill(
            child: ClipPath(
              clipper: _PopOutClipper(diameter: circleSize),
              child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: size * 0.65,
                  height: size * 0.975,
                  child: const CustomPaint(painter: _DrinkPainter()),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// The centered circle plus everything above its middle, so content can
/// overflow the top of the circle but never its bottom.
class _PopOutClipper extends CustomClipper<Path> {
  const _PopOutClipper({required this.diameter});

  final double diameter;

  @override
  Path getClip(Size size) {
    final center = size.center(Offset.zero);
    return Path()
      ..addOval(Rect.fromCircle(center: center, radius: diameter / 2))
      ..addRect(Rect.fromLTWH(0, 0, size.width, center.dy));
  }

  @override
  bool shouldReclip(covariant _PopOutClipper oldClipper) =>
      oldClipper.diameter != diameter;
}

/// A caramel iced drink: cup, whipped cream, drizzle, straw and a badge.
class _DrinkPainter extends CustomPainter {
  const _DrinkPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // Straw behind the cream.
    canvas.drawLine(
      Offset(w * 0.6, h * 0.3),
      Offset(w * 0.82, h * 0.02),
      Paint()
        ..color = const Color(0xFF8CC46C)
        ..strokeWidth = w * 0.07
        ..strokeCap = StrokeCap.round,
    );

    // Cup body.
    final cupTop = h * 0.36;
    final cup = Path()
      ..moveTo(w * 0.06, cupTop)
      ..lineTo(w * 0.94, cupTop)
      ..lineTo(w * 0.82, h * 0.97)
      ..quadraticBezierTo(w * 0.5, h * 1.0, w * 0.18, h * 0.97)
      ..close();
    canvas.drawPath(
      cup,
      Paint()
        ..shader = const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFFB98256), Color(0xFFD7A87A), Color(0xFFA9714A)],
          stops: [0.0, 0.45, 1.0],
        ).createShader(Rect.fromLTWH(0, cupTop, w, h - cupTop)),
    );

    // Condensation dots.
    final dot = Paint()..color = Colors.white.withValues(alpha: 0.25);
    for (var i = 0; i < 26; i++) {
      final x = w * (0.2 + (i * 37 % 60) / 100);
      final y = cupTop + (h * 0.58) * ((i * 53 % 97) / 97) + 8;
      canvas.drawCircle(Offset(x, y), 1.4, dot);
    }

    // Lid rim.
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, cupTop - h * 0.03, w, h * 0.05),
        const Radius.circular(4),
      ),
      Paint()..color = const Color(0xFFF4F1EC),
    );

    // Whipped cream dome made of overlapping puffs.
    final cream = Paint()..color = const Color(0xFFFFFBF5);
    for (final (dx, dy, r) in const [
      (0.18, 0.31, 0.15),
      (0.38, 0.27, 0.18),
      (0.62, 0.27, 0.18),
      (0.82, 0.31, 0.15),
      (0.5, 0.19, 0.17),
      (0.32, 0.2, 0.12),
      (0.68, 0.2, 0.12),
    ]) {
      canvas.drawCircle(Offset(w * dx, h * dy), w * r, cream);
    }

    // Caramel drizzle.
    final drizzle = Paint()
      ..color = const Color(0xFFC98340)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.6
      ..strokeCap = StrokeCap.round;
    for (final (y, amp) in const [(0.14, 0.03), (0.22, 0.035), (0.3, 0.03)]) {
      final path = Path()..moveTo(w * 0.12, h * y);
      for (var i = 0; i < 4; i++) {
        final x0 = 0.12 + i * 0.19;
        path.quadraticBezierTo(
          w * (x0 + 0.095),
          h * (y + (i.isEven ? amp : -amp)),
          w * (x0 + 0.19),
          h * y,
        );
      }
      canvas.drawPath(path, drizzle);
    }

    // Green badge with a coffee bean.
    final badgeCenter = Offset(w * 0.5, h * 0.64);
    canvas.drawCircle(badgeCenter, w * 0.2, Paint()..color = Colors.white);
    canvas.drawCircle(
      badgeCenter,
      w * 0.17,
      Paint()..color = QahwaColors.green,
    );
    canvas.save();
    canvas.translate(badgeCenter.dx, badgeCenter.dy);
    canvas.rotate(-0.5);
    canvas.drawOval(
      Rect.fromCenter(center: Offset.zero, width: w * 0.13, height: w * 0.18),
      Paint()..color = Colors.white,
    );
    canvas.drawLine(
      Offset(0, -w * 0.07),
      Offset(0, w * 0.07),
      Paint()
        ..color = QahwaColors.green
        ..strokeWidth = 2,
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
