import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../widgets/page_scaffold.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final screenWidth = MediaQuery.of(context).size.width;

    return PageScaffold(
      title: 'Home | Alejandro Fernández Alburquerque',
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
                      text: 'Curriculum Vitae',
                      style: TextStyle(
                        color: colorScheme.secondary,
                        decoration: TextDecoration.underline,
                        decorationColor: colorScheme.secondary,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async => context.navigateNamedTo('/cv'),
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
