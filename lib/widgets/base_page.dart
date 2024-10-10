import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'home_button.dart';
import '../utils.dart';

class RouteDestination {
  const RouteDestination({required this.label, required this.icon});

  final String label;
  final Widget icon;

  void go(BuildContext context) {
    GoRouter.of(context).goNamed(label);
  }
}

class BasePage extends StatelessWidget {
  static const menuRoutes = [
    RouteDestination(label: 'Research', icon: Icon(Icons.article)),
    RouteDestination(label: 'Projects', icon: Icon(Icons.terminal)),
    RouteDestination(label: 'Curriculum Vitae', icon: Icon(Icons.school)),
  ];

  static const githubUrl = 'https://github.com/Alejandro-FA';
  static const linkedinUrl =
      'https://www.linkedin.com/in/alejandro-fernandez-alburquerque/';

  const BasePage({super.key, required this.bodySlivers});

  final List<Widget> bodySlivers;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      drawer: NavigationDrawer(
        onDestinationSelected: (selectedIndex) =>
            menuRoutes[selectedIndex].go(context),
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
              padding: const EdgeInsets.all(0),
              iconSize: 40,
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          ...menuRoutes.map((route) {
            return NavigationDrawerDestination(
              label: Text(route.label, style: textTheme.titleMedium),
              icon: route.icon,
            );
          }),
          const Divider(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/github.svg',
                  height: 30,
                  colorFilter: ColorFilter.mode(
                    theme.colorScheme.onSurface,
                    BlendMode.srcIn,
                  ),
                ),
                onPressed: () => openWebpage(githubUrl),
                padding: const EdgeInsets.all(10),
              ),
              IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/linkedin.svg',
                  height: 30,
                  colorFilter: ColorFilter.mode(
                    theme.colorScheme.onSurface,
                    BlendMode.srcIn,
                  ),
                ),
                onPressed: () => openWebpage(linkedinUrl),
                padding: const EdgeInsets.all(10),
              ),
            ],
          ),
        ],
      ),
      body: CustomScrollView(
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
    );
  }

  /// Builds the actions menu for the app bar.
  List<Widget> _buildActions(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final actions = menuRoutes.map((route) {
      return TextButton(
        style: TextButton.styleFrom(
          textStyle: textTheme.titleMedium?.copyWith(color: null),
        ),
        onPressed: () => route.go(context),
        child: Text(route.label),
      );
    }).toList();

    final drawerButton = Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        );
      },
    );

    return MaterialWindowSizeClass.of(context) >=
            MaterialWindowSizeClass.expanded
        ? actions
        : [drawerButton];
  }
}
