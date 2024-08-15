import 'package:flutter/material.dart';
import 'base.dart';

class CVPage extends StatelessWidget {
  const CVPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BasePage(
      bodySlivers: [
        SliverFillRemaining(
          hasScrollBody: true,
          child: Center(
            child: Text(
              'Curriculum Vitae | Work in progress',
              style: textTheme.displayLarge,
            ),
          ),
        ),
      ],
    );
  }
}
