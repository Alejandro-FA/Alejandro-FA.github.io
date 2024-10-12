import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../widgets/base_page.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BasePage(
      title: 'Home | Alejandro Fernández Alburquerque',
      socialMediaRail: true,
      slivers: [
        SliverFillRemaining(
          hasScrollBody: true,
          child: Center(
            child: Text(
              'Home | Work in progress',
              style: textTheme.displayLarge,
            ),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: true,
          child: Center(
            child: Text(
              'Home | Work in progress',
              style: textTheme.bodyLarge
                  ?.copyWith(fontVariations: const [FontVariation.weight(100)]),
            ),
          ),
        ),
      ],
    );
  }
}
