import 'package:flutter/material.dart';

/// An enumeration of the different window sizes according to the [Material
/// Design 3 guidelines](https://m3.material.io/foundations/layout/applying-layout/window-size-classes).
enum MaterialWindowClass implements Comparable<MaterialWindowClass> {
  compact(minDP: 0, maxDP: 600, panes: 1),
  medium(minDP: 600, maxDP: 840, panes: 1),
  expanded(minDP: 840, maxDP: 1200, panes: 2),
  large(minDP: 1200, maxDP: 1600, panes: 2),
  extraLarge(minDP: 1600, maxDP: double.infinity, panes: 3);

  const MaterialWindowClass({
    required this.minDP,
    required this.maxDP,
    required this.panes,
  });

  /// Minimum width in Density-independent Pixels.
  final double minDP;

  /// Maximum width in Density-independent Pixels.
  final double maxDP;

  /// Recommended number of panes to divide the screen.
  final int panes;

  /// Returns the [MaterialWindowClass] based on the screen width.
  static MaterialWindowClass of(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < MaterialWindowClass.compact.maxDP) {
      return MaterialWindowClass.compact;
    } else if (width < MaterialWindowClass.medium.maxDP) {
      return MaterialWindowClass.medium;
    } else if (width < MaterialWindowClass.expanded.maxDP) {
      return MaterialWindowClass.expanded;
    } else if (width < MaterialWindowClass.large.maxDP) {
      return MaterialWindowClass.large;
    } else {
      return MaterialWindowClass.extraLarge;
    }
  }

  @override
  int compareTo(MaterialWindowClass other) => minDP.compareTo(other.minDP);

  bool operator <(MaterialWindowClass other) => minDP < other.minDP;
  bool operator <=(MaterialWindowClass other) => minDP <= other.minDP;
  bool operator >(MaterialWindowClass other) => minDP > other.minDP;
  bool operator >=(MaterialWindowClass other) => minDP >= other.minDP;
}
