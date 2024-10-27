import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../services/webpage_launcher.dart';
import '../widgets/page_scaffold.dart';

@RoutePage()
class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});
  static const githubUrl = 'https://github.com/Alejandro-FA';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final screenWidth = MediaQuery.of(context).size.width;

    return PageScaffold(
      title: 'Projects | Alejandro Fernández Alburquerque',
      socialMediaRail: true,
      slivers: [
        SliverFillRemaining(
          hasScrollBody: true,
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.1),
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
