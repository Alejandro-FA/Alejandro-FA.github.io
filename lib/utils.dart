import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// An enumeration of the different window sizes according to the [Material
/// Design 3 guidelines](https://m3.material.io/foundations/layout/applying-layout/window-size-classes).
enum MaterialWindowSizeClass implements Comparable<MaterialWindowSizeClass> {
  compact(minDP: 0, maxDP: 600, panes: 1),
  medium(minDP: 600, maxDP: 840, panes: 1),
  expanded(minDP: 840, maxDP: 1200, panes: 2),
  large(minDP: 1200, maxDP: 1600, panes: 2),
  extraLarge(minDP: 1600, maxDP: double.infinity, panes: 3);

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

void openWebpage(String url) {
  final uri = Uri.parse(url);
  assert(uri.scheme == 'https', 'URL must be secure');
  unawaited(_openUrl(uri).catchError(
    (Object error) => throw error as Exception,
    test: (error) => error is Exception,
  ));
}

Future<void> _openUrl(Uri uri) async {
  if (!await launchUrl(uri)) {
    throw Exception('Could not launch $uri');
  }
}

extension AppNavigation on BuildContext {
  void navigateTo(String path) {
    // ignore: discarded_futures
    AutoRouter.of(this).navigateNamed(path).then(
          (value) => Scaffold.of(this).closeDrawer(),
        );
  }
}
