import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils.dart';
import 'floating_rail.dart';
import 'home_button.dart';

class MenuRoute {
  const MenuRoute({
    required this.name,
    required this.path,
    required this.icon,
  });

  final String name;
  final String path;
  final Widget icon;
}

class SocialMedia {
  const SocialMedia({required this.url, required this.iconPath});

  final String url;
  final String iconPath;
}

class BasePage extends StatelessWidget {
  const BasePage({
    required this.slivers,
    super.key,
    this.title = 'Alejandro Fernández Alburquerque',
    this.socialMediaRail = false,
    this.floatingActionButton,
  });

  final List<Widget> slivers;
  final String title;
  final bool socialMediaRail;
  final Widget? floatingActionButton;

  final menuRoutes = const [
    MenuRoute(
      name: 'Research',
      path: '/research',
      icon: Icon(Icons.article),
    ),
    MenuRoute(
      name: 'Projects',
      path: '/projects',
      icon: Icon(Icons.terminal),
    ),
    MenuRoute(
      name: 'Curriculum Vitae',
      path: '/cv',
      icon: Icon(Icons.school),
    ),
  ];

  final socialMedia = const [
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Title(
      title: title,
      color: theme.colorScheme.primary,
      child: Scaffold(
        floatingActionButton: floatingActionButton,
        drawer: _Drawer(menuRoutes: menuRoutes, socialMedia: socialMedia),
        body: Stack(
          alignment: MaterialWindowSizeClass.of(context) >=
                  MaterialWindowSizeClass.expanded
              ? AlignmentDirectional.centerEnd
              : AlignmentDirectional.bottomCenter,
          children: [
            CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                _TopBar(menuRoutes: menuRoutes),
                ...slivers,
              ],
            ),
            if (socialMediaRail)
              Padding(
                padding: const EdgeInsets.all(10),
                child: _SocialMediaRail(socialMedia: socialMedia),
              ),
          ],
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({required this.menuRoutes});

  final List<MenuRoute> menuRoutes;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

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
      actions: [
        if (_isWideScreen(context))
          ...menuRoutes.map(
            (route) => TextButton(
              style: TextButton.styleFrom(
                textStyle: textTheme.titleMedium?.copyWith(color: null),
                padding: const EdgeInsets.all(16),
              ),
              onPressed: () => context.navigateTo(route.path),
              child: Text(route.name),
            ),
          )
        else
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
      ],
    );
  }
}

class _Drawer extends StatelessWidget {
  const _Drawer({
    required this.menuRoutes,
    required this.socialMedia,
  });

  final List<MenuRoute> menuRoutes;
  final List<SocialMedia> socialMedia;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return NavigationDrawer(
      onDestinationSelected: (selectedIndex) =>
          context.navigateTo(menuRoutes[selectedIndex].path),
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
          ),
        ),
        ...menuRoutes.map(
          (route) => NavigationDrawerDestination(
            label: Text(route.name, style: textTheme.titleMedium),
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
                onPressed: () => openWebpage(media.url),
                padding: const EdgeInsets.all(10),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SocialMediaRail extends StatelessWidget {
  _SocialMediaRail({required this.socialMedia})
      : icons = socialMedia
            .map((media) => SvgPicture.asset(media.iconPath, height: 30))
            .toList();

  final List<SocialMedia> socialMedia;
  final List<SvgPicture> icons;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FloatingRail(
      axis: _isWideScreen(context) ? Axis.vertical : Axis.horizontal,
      backgroundColor: theme.colorScheme.tertiaryContainer,
      opacity: 0.9,
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
            hoverColor: theme.colorScheme.tertiaryFixedDim,
            focusColor: theme.colorScheme.tertiaryFixedDim,
            onPressed: () => openWebpage(media.url),
            padding: const EdgeInsets.all(10),
          ),
        ),
      ],
    );
  }
}

bool _isWideScreen(BuildContext context) =>
    MaterialWindowSizeClass.of(context) >= MaterialWindowSizeClass.expanded;
