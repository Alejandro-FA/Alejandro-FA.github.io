import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../widgets/sliver_scaffold.dart';
import '../widgets/adaptive_sliver_app_bar.dart';

class BasePage extends StatelessWidget {
  const BasePage({super.key, required this.bodySlivers});

  final List<Widget> bodySlivers;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SliverScaffold(
      appBar: AdaptiveSliverAppBar(
        menuRoutesNames: const [
          'Research',
          'Projects',
          'Curriculum Vitae',
        ],
        title: TextButton.icon(
          style: TextButton.styleFrom(
            overlayColor: Colors.transparent,
            shape:
                const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          ),
          icon: SvgPicture.asset('assets/icons/portfolio-icon.svg'),
          onPressed: () => GoRouter.of(context).go('/'),
          label: Text(
            'My Portfolio',
            style: textTheme.titleLarge,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      bodySlivers: bodySlivers,
    );
  }
}
