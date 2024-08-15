import 'package:flutter/material.dart';
import 'base.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BasePage(
      bodySlivers: [
        SliverFillRemaining(
          hasScrollBody: true,
          child: Center(
            child: Text(
              'Projects | Work in progress',
              style: textTheme.displayLarge,
            ),
          ),
        ),
      ],
    );
  }
}
