import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

/// Decides the [UrlStrategy] based on the platform.
///
/// For GitHub pages, it is set to [HashUrlStrategy], as it does not support
/// path-based URLs. For all other platforms, it is set to [PathUrlStrategy].
void decideUrlStrategy() {
  final isGitHub = Uri.base.host.endsWith('github.io');
  // ignore: prefer_const_constructors
  final strategy = isGitHub ? HashUrlStrategy() : PathUrlStrategy();
  setUrlStrategy(strategy);
}

enum MaterialWindowSizeClass implements Comparable<MaterialWindowSizeClass> {
  compact(minWidth: 0, maxWidth: 600),
  medium(minWidth: 600, maxWidth: 840),
  expanded(minWidth: 840, maxWidth: 1200),
  large(minWidth: 1200, maxWidth: 1600),
  extraLarge(minWidth: 1600, maxWidth: double.infinity);

  const MaterialWindowSizeClass({
    required this.minWidth,
    required this.maxWidth,
  });
  final double minWidth;
  final double maxWidth;

  static MaterialWindowSizeClass of(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < MaterialWindowSizeClass.compact.maxWidth) {
      return MaterialWindowSizeClass.compact;
    } else if (width < MaterialWindowSizeClass.medium.maxWidth) {
      return MaterialWindowSizeClass.medium;
    } else if (width < MaterialWindowSizeClass.expanded.maxWidth) {
      return MaterialWindowSizeClass.expanded;
    } else if (width < MaterialWindowSizeClass.large.maxWidth) {
      return MaterialWindowSizeClass.large;
    } else {
      return MaterialWindowSizeClass.extraLarge;
    }
  }

  @override
  int compareTo(MaterialWindowSizeClass other) => minWidth.compareTo(other.minWidth);

  bool operator <(MaterialWindowSizeClass other) => minWidth < other.minWidth;
  bool operator <=(MaterialWindowSizeClass other) => minWidth <= other.minWidth;
  bool operator >(MaterialWindowSizeClass other) => minWidth > other.minWidth;
  bool operator >=(MaterialWindowSizeClass other) => minWidth >= other.minWidth;
}
