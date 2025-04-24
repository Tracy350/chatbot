import 'package:flutter/material.dart';

class AppTheme {
  // 🎨 Colors
  static const Color primaryColor = Color(0xFF7F2CCB);
  static const Color secondaryColor = Color(0xFFFF84E8);
  static const Color tilebg = Color(0xFFEDFFF4);
  static const Color tiletxt = Color(0xFF37C871);

  static const Color checkboxgrad2 = Color(0xFF5FE394);

  static const Color textColor = Colors.white;
  static const Color hintTextColor = Colors.grey;
  static const Color errorColor = Colors.redAccent;

  // 🔠 Text Styles
  static const TextStyle heading = TextStyle(
    color: textColor,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle body = TextStyle(color: textColor, fontSize: 16);

  static const TextStyle label = TextStyle(color: hintTextColor, fontSize: 14);

  // 📏 Spacing
  static const double padding = 16.0;
  static const double radius = 12.0;

  // 🧱 Border radius
  static BorderRadius get borderRadius => BorderRadius.circular(radius);

  // 🖌️ Input decoration
  // static InputDecoration inputDecoration(String label) {
  //   return InputDecoration(
  //     labelText: label,
  //     labelStyle: label,
  //     filled: true,
  //     fillColor: surfaceColor,
  //     enabledBorder: OutlineInputBorder(
  //       borderRadius: borderRadius,
  //       borderSide: const BorderSide(color: hintTextColor),
  //     ),
  //     focusedBorder: OutlineInputBorder(
  //       borderRadius: borderRadius,
  //       borderSide: const BorderSide(color: primaryColor),
  //     ),
  //   );
  // }
}
