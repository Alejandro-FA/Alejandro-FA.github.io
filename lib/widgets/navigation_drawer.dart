import 'package:auto_route/auto_route.dart' hide RouteData;
import 'package:flutter/material.dart';

import '../models/route_data.dart';
import '../models/social_media_data.dart';
import 'better_link.dart';
import 'home_button.dart';
import 'social_media_button.dart';

class MyNavigationDrawer extends StatelessWidget {
  const MyNavigationDrawer({
    required this.menuRoutes,
    required this.socialMedia,
    super.key,
  });

  final List<RouteData> menuRoutes;
  final List<SocialMediaData> socialMedia;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return NavigationDrawer(
      onDestinationSelected: (selectedIndex) async {
        Scaffold.of(context).closeDrawer();
        await context.navigateNamedTo(menuRoutes[selectedIndex].path);
      },
      selectedIndex: null,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: theme.colorScheme.primary,
          ),
          child: HomeButton(
            textStyle: textTheme.headlineLarge?.copyWith(
              color: theme.colorScheme.onPrimary,
            ),
            padding: EdgeInsets.zero,
            iconSize: 40,
          ),
        ),
        ...menuRoutes.map((route) => _NavigationDestination(route: route)),
        const Divider(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...socialMedia.map(
              (media) => SocialMediaButton(
                media,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _NavigationDestination extends StatelessWidget {
  const _NavigationDestination({required this.route});

  final RouteData route;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return BetterLink(
      uri: Uri.parse(route.path),
      builder: (context, followLink) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: TextButton.icon(
          style: ButtonStyle(
            alignment: Alignment.centerLeft,
            padding: const WidgetStatePropertyAll(
              EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 24,
              ),
            ),
            overlayColor: WidgetStatePropertyAll(
              colorScheme.onSurfaceVariant.withOpacity(0.05),
            ),
          ),
          icon: Icon(
            route.icon,
            color: colorScheme.onSurfaceVariant,
          ),
          label: Text(
            route.name,
            style: textTheme.titleMedium,
          ),
          onPressed: followLink,
        ),
      ),
    );
  }
}
