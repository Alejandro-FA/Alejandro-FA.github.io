import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../utils.dart';
import '../widgets/base_page.dart';

@RoutePage()
class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const githubUrl = 'https://github.com/Alejandro-FA';
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return BasePage(
      title: 'Projects | Alejandro Fernández Alburquerque',
      slivers: [
        SliverFillRemaining(
          hasScrollBody: true,
          child: Padding(
            padding: const EdgeInsets.all(100),
            child: Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: textTheme.displaySmall,
                  children: [
                    const TextSpan(
                      text: 'Work in progress. Take a look at my ',
                    ),
                    TextSpan(
                      text: 'GitHub profile',
                      style: TextStyle(
                        color: theme.colorScheme.tertiary,
                        decoration: TextDecoration.underline,
                        decorationColor: theme.colorScheme.tertiary,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async => openWebpage(githubUrl),
                    ),
                    const TextSpan(
                      text: ' in the meantime.',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
