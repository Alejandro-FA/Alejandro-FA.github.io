import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResponsiveAppBar extends StatelessWidget {
  const ResponsiveAppBar({
    super.key,
    required this.title,
    required this.logoPath,
    required this.menus,
  });

  final String title;
  final String logoPath;
  final List<String> menus;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final wideScreen = MediaQuery.sizeOf(context).width > 840;
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
      leading: IconButton(
        icon: SvgPicture.asset(logoPath),
        onPressed: () {},
      ),
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
      logoPath: 'assets/icons/portfolio-icon.svg',
      menus: const ['Research', 'Projects', 'Curriculum Vitae'],
    );
  }
}
