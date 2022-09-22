import 'package:flutter/material.dart';

extension TextSizeExtension on Text {
  Size get getTextSize {
    final textPainter = TextPainter(
      text: TextSpan(text: data, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
      textWidthBasis: TextWidthBasis.longestLine,
    )..layout();
    return textPainter.size;
  }
}
