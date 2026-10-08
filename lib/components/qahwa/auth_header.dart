import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/qahwa_colors.dart';

/// Big title with a muted subtitle underneath.
class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 32,
            height: 1.2,
            fontWeight: FontWeight.w700,
            color: QahwaColors.ink,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: GoogleFonts.poppins(fontSize: 14, color: QahwaColors.grey),
        ),
      ],
    );
  }
}
