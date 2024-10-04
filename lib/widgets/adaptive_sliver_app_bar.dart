import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../utils.dart';

/// A [SliverAppBar] that adapts the navigation menu to the screen size.
class AdaptiveSliverAppBar extends StatelessWidget {
  /// Creates an [AdaptiveSliverAppBar] that can be used in a [CustomScrollView]
  /// or in a [SliverScaffold].
  const AdaptiveSliverAppBar({
    super.key,
    required this.menuRoutesNames,
    this.title,
    this.leading,
    this.shape,
  });

  /// The primary widget displayed in the app bar.
  final Widget? title;

  /// A widget to display before the toolbar's [title].
  final Widget? leading;

  /// A list of [GoRoute] names to be used as navigation menu items.
  ///
  /// These routes must be defined in the [GoRouter] passed to [MaterialApp.router].
  /// If the route name belongs to a valid [GoRoute], pressing on the corresponding
  /// menu item will navigate to that route.
  final List<String> menuRoutesNames;

  /// The shape of the app bar's [Material] as well as its shadow.
  ///
  /// By default it is a simple rectangle.
  final ShapeBorder? shape;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      floating: true,
      snap: false,
      centerTitle: false,
      forceMaterialTransparency: true,
      shape: shape,
      leading: leading,
      title: title,
      titleSpacing: 0,
      actions: _buildActions(context),
      // expandedHeight: 200,
      // flexibleSpace: const FlexibleSpaceBar(
      //   title: Text('SliverAppBar'),
      //   background: FlutterLogo(),
      // ),
    );
  }

  /// Builds the actions menu for the app bar.
  List<Widget> _buildActions(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final actions = menuRoutesNames.map((routeName) {
      return TextButton(
        style: TextButton.styleFrom(
          textStyle: textTheme.titleMedium?.copyWith(color: null),
        ),
        onPressed: () => GoRouter.of(context).goNamed(routeName),
        child: Text(routeName),
      );
    }).toList();

    final drawerButton = IconButton(
      icon: const Icon(Icons.menu),
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
    );

    return MaterialWindowSizeClass.of(context) >=
            MaterialWindowSizeClass.expanded
        ? actions
        : [drawerButton];
  }
}
