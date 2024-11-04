import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MarkdownTheme extends InheritedWidget {
  const MarkdownTheme(
    this.styleSheet, {
    required super.child,
    super.key,
  });

  MarkdownTheme.fromTheme(
    ThemeData theme, {
    required super.child,
    super.key,
  }) : styleSheet = _defaultFromTheme(theme);

  final MarkdownStyleSheet styleSheet;

  static MarkdownStyleSheet of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<MarkdownTheme>();
    return result?.styleSheet ?? _defaultFromTheme(Theme.of(context));
  }

  static MarkdownStyleSheet _defaultFromTheme(ThemeData theme) {
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return MarkdownStyleSheet.fromTheme(theme).copyWith(
      h1: textTheme.headlineLarge?.copyWith(color: colorScheme.tertiary),
      h2: textTheme.headlineMedium?.copyWith(color: colorScheme.tertiary),
      h3: textTheme.headlineSmall?.copyWith(color: colorScheme.tertiary),
      h4: textTheme.titleLarge?.copyWith(color: colorScheme.tertiary),
      h5: textTheme.titleMedium?.copyWith(color: colorScheme.tertiary),
      h6: textTheme.titleSmall?.copyWith(color: colorScheme.tertiary),
      p: textTheme.bodyLarge?.copyWith(height: 1.5),
      a: TextStyle(
        color: colorScheme.primary,
        decoration: TextDecoration.underline,
        decorationColor: colorScheme.primary,
      ),
      em: TextStyle(color: colorScheme.secondary, fontStyle: FontStyle.normal),
      textAlign: WrapAlignment.spaceBetween,
    );
  }

  @override
  bool updateShouldNotify(MarkdownTheme oldWidget) =>
      styleSheet != oldWidget.styleSheet;
}
