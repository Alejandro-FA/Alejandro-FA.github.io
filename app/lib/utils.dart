import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

/// Returns how much width the given [text] will take in the screen when rendered.
///
/// To get an accurate width, the [textStyle] should be the same as the style used
/// to render the text on the screen, as well as the values of [maxlines] and
/// [textDirection].
double computeTextWidth(String text,
    {TextStyle? textStyle, int maxlines = 1, TextDirection textDirection = TextDirection.ltr}) {
  final TextPainter textPainter = TextPainter(
    text: TextSpan(text: text, style: textStyle),
    maxLines: maxlines,
    textDirection: textDirection,
  )..layout();

  return textPainter.size.width;
}

/// Decides the [UrlStrategy] based on the platform.
///
/// For GitHub pages, it is set to [HashUrlStrategy], as it does not support
/// path-based URLs. For all other platforms, it is set to [PathUrlStrategy].
void decidetUrlStrategy() {
  if (Uri.base.host.endsWith('github.io')) {
    setUrlStrategy(const HashUrlStrategy());
  } else {
    setUrlStrategy(const PathUrlStrategy());
  }
}
