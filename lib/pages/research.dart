import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../utils.dart';
import '../widgets/base_page.dart';

@RoutePage()
class ResearchPage extends StatelessWidget {
  const ResearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    const orcidUrl = 'https://orcid.org/0009-0009-0884-7015';
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return BasePage(
      title: 'Research | Alejandro Fernández Alburquerque',
      slivers: [
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
                    text: 'ORCID profile',
                    style: TextStyle(
                      color: theme.colorScheme.tertiary,
                      decoration: TextDecoration.underline,
                      decorationColor: theme.colorScheme.tertiary,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async => openWebpage(orcidUrl),
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
