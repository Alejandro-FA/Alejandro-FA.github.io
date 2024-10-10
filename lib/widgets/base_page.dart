import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../widgets/sliver_scaffold.dart';
import '../utils.dart';

class BasePage extends StatelessWidget {
  static const menuRoutes = [
    'Research',
    'Projects',
    'Curriculum Vitae',
  ];

  const BasePage({super.key, required this.bodySlivers});

  final List<Widget> bodySlivers;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SliverScaffold(
      appBar: SliverAppBar(
        pinned: false,
        floating: true,
        snap: false,
        centerTitle: false,
        forceMaterialTransparency: true,
        title: TextButton.icon(
          style: TextButton.styleFrom(
            overlayColor: Colors.transparent,
            shape:
                const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          ),
          icon: SvgPicture.asset('assets/icons/portfolio-icon.svg'),
          onPressed: () => GoRouter.of(context).go('/'),
          label: Text(
            'Alejandro',
            style: textTheme.titleLarge,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        titleSpacing: 0,
        actions: _buildActions(context),
      ),
      bodySlivers: bodySlivers,
    );
  }

  /// Builds the actions menu for the app bar.
  List<Widget> _buildActions(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final actions = menuRoutes.map((routeName) {
      return TextButton(
        style: TextButton.styleFrom(
          textStyle: textTheme.titleMedium?.copyWith(color: null),
        ),
        onPressed: () => GoRouter.of(context).goNamed(routeName),
        child: Text(routeName),
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
