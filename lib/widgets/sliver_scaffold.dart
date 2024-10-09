import 'package:flutter/material.dart';

/// A [Scaffold] specially designed to work with sliver widgets.
class SliverScaffold extends StatelessWidget {
  /// Creates a visual [SliverScaffold] for Material Design sliver widgets.
  const SliverScaffold({
    super.key,
    required this.appBar,
    required this.bodySlivers,
  });

  /// The [AdaptiveSliverAppBar] to display at the top of the [SliverScaffold].
  final SliverAppBar appBar;

  /// The primary content of the [SliverScaffold].
  ///
  /// Displayed below the [appBar]. The body of a [SliverScaffold] should be a
  /// a list of sliver widgets, such as [SliverList], [SliverGrid], [SliverFillRemaining],
  /// or [SliverFillViewport]. These widgets are displayed in a [CustomScrollView].
  final List<Widget> bodySlivers;

  /// The scroll physics to use for the [CustomScrollView] of [SliverScaffold].
  final ScrollPhysics? physics = const BouncingScrollPhysics();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: physics,
        slivers: <Widget>[
          appBar,
          ...bodySlivers,
        ],
      ),
    );
  }
}
