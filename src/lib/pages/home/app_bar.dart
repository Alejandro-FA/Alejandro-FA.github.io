import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResponsiveAppBar extends StatelessWidget {
  const ResponsiveAppBar({
    super.key,
    required this.title,
    required this.menus,
    this.homeIcon = const IconButton(
      icon: Icon(Icons.home),
      onPressed: null,
    ),
    this.wideScreenBreakpoint = 840.0,
  });

  final String title;
  final List<String> menus;
  final IconButton homeIcon;
  final double wideScreenBreakpoint;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final wideScreen = MediaQuery.sizeOf(context).width > wideScreenBreakpoint;
    final actions = menus.map((menu) {
      return TextButton(
        child: Text(menu),
        style: TextButton.styleFrom(
          textStyle: textTheme.titleMedium?.copyWith(color: null),
        ),
        onPressed: () {},
      );
    }).toList();

    return SliverAppBar(
      pinned: false,
      floating: true,
      snap: false,
      centerTitle: false,
      forceMaterialTransparency: true,
      leading: homeIcon,
      title: Text(title),
      actions: wideScreen
          ? actions
          : [
              const IconButton(
                icon: Icon(Icons.menu),
                onPressed: null, // TODO: Implement drawer
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
      title: "Alejandro's Portfolio",
      menus: const ['Research', 'Projects', 'Curriculum Vitae'],
      homeIcon: IconButton(
        icon: SvgPicture.asset('assets/icons/portfolio-icon.svg'),
        onPressed: () {},
      ),
    );
  }
}
