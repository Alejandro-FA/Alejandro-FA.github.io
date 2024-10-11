import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../utils.dart';
import '../widgets/base_page.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const githubUrl = 'https://github.com/Alejandro-FA';
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return BasePage(
      bodySlivers: [
        SliverFillRemaining(
          hasScrollBody: true,
          child: Center(
            child: RichText(
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
      ],
    );
  }
}
