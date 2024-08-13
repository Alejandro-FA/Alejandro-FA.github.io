import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    this.wideScreenBreakpoint = 840.0,
  });

  final String title;
  final List<String> menus;
  final IconButton homeIcon;
  final double wideScreenBreakpoint;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final wideScreen = MediaQuery.sizeOf(context).width > wideScreenBreakpoint;
    final actions = menus.map((menu) {
      return TextButton(
        style: TextButton.styleFrom(
          textStyle: textTheme.titleMedium?.copyWith(color: null),
        ),
        onPressed: () {},
        child: Text(menu),
      );
    }).toList();

    return SliverAppBar(
      pinned: false,
      floating: true,
      snap: false,
      centerTitle: false,
      forceMaterialTransparency: true,
      leading: homeIcon,
      title: LayoutBuilder(builder: (context, constraints) {
        final titleOverflows = constraints.maxWidth <
            computeTextWidth(
              title,
              textStyle: theme.appBarTheme.titleTextStyle ?? textTheme.titleLarge,
            );
        return titleOverflows ? const SizedBox.shrink() : Text(title);
      }),
      actions: wideScreen
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
      menus: const ['Research', 'Projects', 'Curriculum Vitae'],
      homeIcon: IconButton(
        icon: SvgPicture.asset('assets/icons/portfolio-icon.svg'),
        onPressed: () {},
      ),
    );
  }
}
