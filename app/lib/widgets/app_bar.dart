import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../utils.dart';

class ResponsiveAppBar extends StatelessWidget {
  const ResponsiveAppBar({
    super.key,
    required this.title,
    required this.menus,
    this.homeIcon = const IconButton(
      icon: Icon(Icons.home),
      onPressed: null,
    ),
  });

  final String title;
  final Map<String, String> menus; // Maps menu name to route
  final IconButton homeIcon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final actions = menus.entries.map((menu) {
      return TextButton(
        style: TextButton.styleFrom(
          textStyle: textTheme.titleMedium?.copyWith(color: null),
        ),
        onPressed: () => GoRouter.of(context).go(menu.value),
        child: Text(menu.key),
      );
    }).toList();

    return SliverAppBar(
      pinned: false,
      floating: true,
      snap: false,
      centerTitle: false,
      forceMaterialTransparency: true,
      title: TextButton.icon(
        style: const ButtonStyle(
          overlayColor: WidgetStatePropertyAll(Colors.transparent),
        ),
        icon: homeIcon.icon,
        onPressed: homeIcon.onPressed,
        label: Text(
          title,
          style: textTheme.titleLarge,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      actions: MaterialWindowSizeClass.of(context) >= MaterialWindowSizeClass.expanded
          ? actions
          : [
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                }, // TODO: Implement drawer
              ),
            ],
      // expandedHeight: 200,
      // flexibleSpace: const FlexibleSpaceBar(
      //   title: Text('SliverAppBar'),
      //   background: FlutterLogo(),
      // ),
    );
  }
}

class PortfolioAppBar extends StatelessWidget {
  const PortfolioAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveAppBar(
      title: "My portfolio",
      menus: const {
        'Research': '/research',
        'Projects': '/projects',
        'Curriculum Vitae': '/cv',
      },
      homeIcon: IconButton(
        icon: SvgPicture.asset('assets/icons/portfolio-icon.svg'),
        onPressed: () => GoRouter.of(context).go('/'),
      ),
    );
  }
}
