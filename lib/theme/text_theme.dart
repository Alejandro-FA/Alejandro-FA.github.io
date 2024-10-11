import 'package:flutter/material.dart';

TextTheme createTextTheme(
    BuildContext context, String bodyFont, String displayFont) {
  final baseTheme = Theme.of(context).textTheme;

  return baseTheme.copyWith(
    displayLarge: baseTheme.displayLarge?.copyWith(fontFamily: displayFont),
    displayMedium: baseTheme.displayMedium?.copyWith(fontFamily: displayFont),
    displaySmall: baseTheme.displaySmall?.copyWith(fontFamily: displayFont),
    headlineLarge: baseTheme.headlineLarge?.copyWith(fontFamily: displayFont),
    headlineMedium: baseTheme.headlineMedium?.copyWith(fontFamily: displayFont),
    headlineSmall: baseTheme.headlineSmall?.copyWith(fontFamily: displayFont),
    titleLarge: baseTheme.titleLarge?.copyWith(fontFamily: displayFont),
    titleMedium: baseTheme.titleMedium?.copyWith(fontFamily: displayFont),
    titleSmall: baseTheme.titleSmall?.copyWith(fontFamily: displayFont),
    bodyLarge: baseTheme.bodyLarge?.copyWith(fontFamily: bodyFont),
    bodyMedium: baseTheme.bodyMedium?.copyWith(fontFamily: bodyFont),
    bodySmall: baseTheme.bodySmall?.copyWith(fontFamily: bodyFont),
    labelLarge: baseTheme.labelLarge?.copyWith(fontFamily: bodyFont),
    labelMedium: baseTheme.labelMedium?.copyWith(fontFamily: bodyFont),
    labelSmall: baseTheme.labelSmall?.copyWith(fontFamily: bodyFont),
  );
}
