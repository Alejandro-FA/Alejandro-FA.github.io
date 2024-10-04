import 'package:flutter/material.dart';
import 'base.dart';

class ResearchPage extends StatelessWidget {
  const ResearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BasePage(
      bodySlivers: [
        SliverFillRemaining(
          hasScrollBody: true,
          child: Center(
            child: Text(
              'Research | Work in progress',
              style: textTheme.displayLarge,
            ),
          ),
        ),
      ],
    );
  }
}
