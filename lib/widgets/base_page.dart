import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../utils.dart';
import 'floating_rail.dart';
import 'home_button.dart';

class RouteDestination {
  const RouteDestination({required this.label, required this.icon});

  final String label;
  final Widget icon;

  void go(BuildContext context) {
    GoRouter.of(context).goNamed(label);
  }
}

class SocialMedia {
  const SocialMedia({required this.url, required this.iconPath});

  final String url;
  final String iconPath;
}

class BasePage extends StatelessWidget {
  const BasePage({
    required this.bodySlivers,
    super.key,
    this.socialMediaRail = false,
  });

  static const menuRoutes = [
    RouteDestination(label: 'Research', icon: Icon(Icons.article)),
    RouteDestination(label: 'Projects', icon: Icon(Icons.terminal)),
    RouteDestination(label: 'Curriculum Vitae', icon: Icon(Icons.school)),
  ];

  static const socialMedia = [
    SocialMedia(
      url: 'https://github.com/Alejandro-FA',
      iconPath: 'assets/icons/github.svg',
    ),
    SocialMedia(
      url: 'https://www.linkedin.com/in/alejandro-fernandez-alburquerque/',
      iconPath: 'assets/icons/linkedin.svg',
    ),
    SocialMedia(
      url: 'https://orcid.org/0009-0009-0884-7015',
      iconPath: 'assets/icons/orcid.svg',
    ),
  ];

  final List<Widget> bodySlivers;
  final bool socialMediaRail;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      drawer: NavigationDrawer(
        onDestinationSelected: (selectedIndex) => {
          Navigator.of(context).pop(),
          menuRoutes[selectedIndex].go(context)
        },
        selectedIndex: null,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: HomeButton(
              textStyle: textTheme.headlineLarge?.copyWith(
                color: theme.colorScheme.onPrimary,
              ),
              padding: EdgeInsets.zero,
              iconSize: 40,
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          ...menuRoutes.map(
            (route) => NavigationDrawerDestination(
              label: Text(route.label, style: textTheme.titleMedium),
              icon: route.icon,
            ),
          ),
          const Divider(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...socialMedia.map(
                (media) => IconButton(
                  icon: SvgPicture.asset(
                    media.iconPath,
                    height: 30,
                    colorFilter: ColorFilter.mode(
                      theme.colorScheme.onSurface,
                      BlendMode.srcIn,
                    ),
                  ),
                  onPressed: () async => openWebpage(media.url),
                  padding: const EdgeInsets.all(10),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Stack(
        alignment: MaterialWindowSizeClass.of(context) >=
                MaterialWindowSizeClass.expanded
            ? AlignmentDirectional.centerEnd
            : AlignmentDirectional.bottomCenter,
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                pinned: false,
                floating: true,
                snap: false,
                centerTitle: false,
                forceMaterialTransparency: true,
                automaticallyImplyLeading: false,
                title: HomeButton(
                  textStyle: textTheme.titleLarge,
                ),
                titleSpacing: 0,
                actions: _buildActions(context),
              ),
              ...bodySlivers,
            ],
          ),
          if (socialMediaRail)
            Padding(
              padding: const EdgeInsets.all(10),
              child: FloatingRail(
                axis: MaterialWindowSizeClass.of(context) >=
                        MaterialWindowSizeClass.expanded
                    ? Axis.vertical
                    : Axis.horizontal,
                children: [
                  ...socialMedia.map(
                    (media) => IconButton(
                      icon: SvgPicture.asset(
                        media.iconPath,
                        height: 30,
                        colorFilter: ColorFilter.mode(
                          theme.colorScheme.onTertiaryContainer,
                          BlendMode.srcIn,
                        ),
                      ),
                      onPressed: () async => openWebpage(media.url),
                      padding: const EdgeInsets.all(10),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  /// Builds the actions menu for the app bar.
  List<Widget> _buildActions(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final actions = menuRoutes.map(
      (route) => TextButton(
        style: TextButton.styleFrom(
          textStyle: textTheme.titleMedium?.copyWith(color: null),
        ),
        onPressed: () => route.go(context),
        child: Text(route.label),
      ),
    );

    final drawerButton = Builder(
      builder: (context) => IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
    );

    return MaterialWindowSizeClass.of(context) >=
            MaterialWindowSizeClass.expanded
        ? actions.toList()
        : [drawerButton];
  }
}
