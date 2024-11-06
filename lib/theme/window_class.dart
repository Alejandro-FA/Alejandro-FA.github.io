import 'package:flutter/material.dart';

/// An enumeration of the different window sizes according to the [Material
/// Design 3 guidelines](https://m3.material.io/foundations/layout/applying-layout/window-size-classes).
enum WindowClass implements Comparable<WindowClass> {
  compact(minDP: 0, maxDP: 600, panes: 1),
  medium(minDP: 600, maxDP: 840, panes: 1),
  expanded(minDP: 840, maxDP: 1200, panes: 2),
  large(minDP: 1200, maxDP: 1600, panes: 2),
  extraLarge(minDP: 1600, maxDP: double.infinity, panes: 3);

  const WindowClass({
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

  /// Returns the [WindowClass] based on the screen width.
  static WindowClass of(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < WindowClass.compact.maxDP) {
      return WindowClass.compact;
    } else if (width < WindowClass.medium.maxDP) {
      return WindowClass.medium;
    } else if (width < WindowClass.expanded.maxDP) {
      return WindowClass.expanded;
    } else if (width < WindowClass.large.maxDP) {
      return WindowClass.large;
    } else {
      return WindowClass.extraLarge;
    }
  }

  @override
  int compareTo(WindowClass other) => minDP.compareTo(other.minDP);

  bool operator <(WindowClass other) => minDP < other.minDP;
  bool operator <=(WindowClass other) => minDP <= other.minDP;
  bool operator >(WindowClass other) => minDP > other.minDP;
  bool operator >=(WindowClass other) => minDP >= other.minDP;
}
