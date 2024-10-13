import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../widgets/base_page.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenWidth = MediaQuery.of(context).size.width;

    return BasePage(
      title: 'Home | Alejandro Fernández Alburquerque',
      socialMediaRail: true,
      slivers: [
        SliverFillRemaining(
          hasScrollBody: true,
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.1),
            child: Center(
              child: Text(
                'Home | Work in progress',
                style: textTheme.displaySmall,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: true,
          child: Center(
            child: Text(
              'Home | Work in progress',
              style: textTheme.bodyLarge?.copyWith(
                fontVariations: const [FontVariation.weight(100)],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
