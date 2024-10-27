import 'package:flutter/material.dart';

import '../models/route_data.dart';
import '../models/social_media_data.dart';
import '../theme/material_window_class.dart';
import 'navigation_drawer.dart';
import 'sliver_app_bar.dart';
import 'social_media_rail.dart';

class PageScaffold extends StatelessWidget {
  const PageScaffold({
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

  static const menuRoutes = [
    RouteData(
      name: 'Research',
      path: '/research',
      icon: Icons.article,
    ),
    RouteData(
      name: 'Projects',
      path: '/projects',
      icon: Icons.terminal,
    ),
    RouteData(
      name: 'Curriculum Vitae',
      path: '/cv',
      icon: Icons.school,
    ),
  ];

  static const socialMedia = [
    SocialMediaData(
      url: 'https://github.com/Alejandro-FA',
      iconPath: 'assets/icons/github.svg',
    ),
    SocialMediaData(
      url: 'https://www.linkedin.com/in/alejandro-fernandez-alburquerque/',
      iconPath: 'assets/icons/linkedin.svg',
    ),
    SocialMediaData(
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
        drawer: const MyNavigationDrawer(
          menuRoutes: menuRoutes,
          socialMedia: socialMedia,
        ),
        body: Stack(
          alignment:
              MaterialWindowClass.of(context) >= MaterialWindowClass.expanded
                  ? AlignmentDirectional.centerEnd
                  : AlignmentDirectional.bottomCenter,
          children: [
            CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                const MySliverAppBar(menuRoutes: menuRoutes),
                ...slivers,
              ],
            ),
            if (socialMediaRail)
              const Padding(
                padding: EdgeInsets.all(10),
                child: SocialMediaRail(socialMedia),
              ),
          ],
        ),
      ),
    );
  }
}
