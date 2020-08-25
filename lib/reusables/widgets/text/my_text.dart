import 'package:flutter/material.dart';

Widget myText({
  final String text,
  final Color color,
  final double fontSize,
  final FontWeight fontWeight,
  final TextOverflow overflow,
  final TextAlign textAlign,
  final TextDecoration textDecoration,
}) {
  return Text(
    "$text",
    overflow: overflow,
    textAlign: textAlign,
    style: TextStyle(
      color: color ?? Colors.black,
      fontSize: fontSize,
      fontWeight: fontWeight,
      decoration: textDecoration ?? null,
    ),
  );
}
