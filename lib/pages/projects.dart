import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import '../widgets/base_page.dart';
import '../utils.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final githubUrl = 'https://github.com/Alejandro-FA';
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
                      ..onTap = () => openWebpage(githubUrl),
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
