import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../utils.dart' show openWebpage;
import '../widgets/base_page.dart';

@RoutePage()
class ResearchPage extends StatelessWidget {
  const ResearchPage({super.key});
  static const orcidUrl = 'https://orcid.org/0009-0009-0884-7015';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final screenWidth = MediaQuery.of(context).size.width;

    return BasePage(
      title: 'Research | Alejandro Fernández Alburquerque',
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
                      text: 'ORCID profile',
                      style: TextStyle(
                        color: theme.colorScheme.tertiary,
                        decoration: TextDecoration.underline,
                        decorationColor: theme.colorScheme.tertiary,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => openWebpage(orcidUrl),
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
