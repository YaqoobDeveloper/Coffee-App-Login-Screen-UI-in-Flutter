import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../theme/qahwa_colors.dart';

/// Round white button holding a brand icon.
class SocialButton extends StatelessWidget {
  const SocialButton({super.key, required this.icon, required this.onTap});

  final FaIconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      elevation: 4,
      shadowColor: Colors.black26,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          width: 56,
          height: 56,
          child: Center(
            child: FaIcon(icon, size: 22, color: QahwaColors.beige),
          ),
        ),
      ),
    );
  }
}
