import 'package:flutter/material.dart';

import '../models/route_data.dart';
import '../theme/window_class.dart';
import 'better_link.dart';
import 'home_button.dart';
import 'language_toggle_button.dart';

class MySliverAppBar extends StatelessWidget {
  const MySliverAppBar({required this.menuRoutes, super.key});

  final List<RouteData> menuRoutes;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final actions = isWideScreen(context)
        ? [
            ...menuRoutes.map((route) => _MenuButton(route: route)),
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: LanguageToggleButton(),
            ),
          ]
        : [
            const Padding(
              padding: EdgeInsets.only(right: 8),
              child: LanguageToggleButton(),
            ),
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ];

    return SliverAppBar(
      pinned: false,
      floating: true,
      snap: false,
      centerTitle: false,
      forceMaterialTransparency: true,
      automaticallyImplyLeading: false,
      title: HomeButton(
        textStyle: textTheme.titleLarge,
        padding: const EdgeInsets.all(16),
      ),
      titleSpacing: 0,
      actions: actions,
    );
  }

  bool isWideScreen(BuildContext context) =>
      WindowClass.of(context) >= WindowClass.expanded;
}

class _MenuButton extends StatelessWidget {
  const _MenuButton({required this.route});

  final RouteData route;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BetterLink(
      uri: Uri.parse(route.path),
      builder: (context, followLink) => TextButton(
        style: TextButton.styleFrom(
          textStyle: textTheme.titleMedium?.copyWith(color: null),
          padding: const EdgeInsets.all(16),
        ),
        onPressed: followLink,
        child: Text(route.name),
      ),
    );
  }
}
