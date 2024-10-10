import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:url_launcher/url_launcher.dart';

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

/// An enumeration of the different window sizes according to the [Material
/// Design 3 guidelines](https://m3.material.io/foundations/layout/applying-layout/window-size-classes).
enum MaterialWindowSizeClass implements Comparable<MaterialWindowSizeClass> {
  compact(
    minDP: 0,
    maxDP: 600,
    panes: 1,
  ),
  medium(
    minDP: 600,
    maxDP: 840,
    panes: 1,
  ),
  expanded(
    minDP: 840,
    maxDP: 1200,
    panes: 2,
  ),
  large(
    minDP: 1200,
    maxDP: 1600,
    panes: 2,
  ),
  extraLarge(
    minDP: 1600,
    maxDP: double.infinity,
    panes: 3,
  );

  const MaterialWindowSizeClass({
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

  /// Returns the [MaterialWindowSizeClass] based on the screen width.
  static MaterialWindowSizeClass of(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < MaterialWindowSizeClass.compact.maxDP) {
      return MaterialWindowSizeClass.compact;
    } else if (width < MaterialWindowSizeClass.medium.maxDP) {
      return MaterialWindowSizeClass.medium;
    } else if (width < MaterialWindowSizeClass.expanded.maxDP) {
      return MaterialWindowSizeClass.expanded;
    } else if (width < MaterialWindowSizeClass.large.maxDP) {
      return MaterialWindowSizeClass.large;
    } else {
      return MaterialWindowSizeClass.extraLarge;
    }
  }

  @override
  int compareTo(MaterialWindowSizeClass other) => minDP.compareTo(other.minDP);

  bool operator <(MaterialWindowSizeClass other) => minDP < other.minDP;
  bool operator <=(MaterialWindowSizeClass other) => minDP <= other.minDP;
  bool operator >(MaterialWindowSizeClass other) => minDP > other.minDP;
  bool operator >=(MaterialWindowSizeClass other) => minDP >= other.minDP;
}

Future<void> openWebpage(String url) async {
  final uri = Uri.parse(url);
  if (!await launchUrl(uri)) {
    throw 'Could not launch $uri';
  }
}
