import 'package:flutter/material.dart';

double computeTextWidth(String text,
    {TextStyle? textStyle, int maxlines = 1, TextDirection textDirection = TextDirection.ltr}) {
  final TextPainter textPainter = TextPainter(
    text: TextSpan(text: text, style: textStyle),
    maxLines: maxlines,
    textDirection: textDirection,
  )..layout();

  return textPainter.size.width;
}
