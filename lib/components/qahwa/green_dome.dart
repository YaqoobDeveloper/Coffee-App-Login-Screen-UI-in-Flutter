import 'package:flutter/material.dart';

import '../../theme/qahwa_colors.dart';

/// Green section whose top edge is a wide arc, like the home screen design.
class GreenDome extends StatelessWidget {
  const GreenDome({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return ClipPath(
      clipper: const _DomeClipper(),
      child: ColoredBox(
        color: QahwaColors.green,
        child: Padding(
          padding: EdgeInsets.fromLTRB(28, 40, 28, 32 + bottomInset),
          child: child,
        ),
      ),
    );
  }
}

class _DomeClipper extends CustomClipper<Path> {
  const _DomeClipper();

  @override
  Path getClip(Size size) {
    const rise = 56.0;
    return Path()
      ..moveTo(0, rise)
      ..quadraticBezierTo(size.width / 2, -rise, size.width, rise)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
