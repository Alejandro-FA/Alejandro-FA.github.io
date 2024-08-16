import 'package:flutter/material.dart';
import 'base.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BasePage(
      bodySlivers: [
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
              style: textTheme.bodyLarge?.copyWith(fontVariations: const [FontVariation.weight(100)]),
            ),
          ),
        ),
      ],
    );
  }
}
