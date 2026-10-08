import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/qahwa_colors.dart';

/// Rounded white input with a beige icon bubble on the left.
class PillTextField extends StatelessWidget {
  const PillTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.onSubmitted,
    this.suffix,
    this.validator,
  });

  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onSubmitted;
  final Widget? suffix;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder border([Color color = Colors.transparent]) =>
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(color: color, width: 1.5),
        );

    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onFieldSubmitted: onSubmitted,
      validator: validator,
      cursorColor: QahwaColors.green,
      style: GoogleFonts.poppins(fontSize: 15, color: QahwaColors.ink),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.poppins(fontSize: 14, color: QahwaColors.grey),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 18),
        // Beige icon bubble, echoing the category circles.
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 8, right: 10),
          child: Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: QahwaColors.beigeLight,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: QahwaColors.beige, size: 20),
          ),
        ),
        suffixIcon: suffix,
        border: border(),
        enabledBorder: border(),
        focusedBorder: border(QahwaColors.beige),
        errorBorder: border(const Color(0xFFFFC9C2)),
        focusedErrorBorder: border(const Color(0xFFFFC9C2)),
        errorStyle: GoogleFonts.poppins(
          fontSize: 12,
          color: const Color(0xFFFFE1DC),
        ),
      ),
    );
  }
}
