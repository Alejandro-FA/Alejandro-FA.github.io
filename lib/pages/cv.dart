import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../widgets/base_page.dart';

@RoutePage()
class CVPage extends StatelessWidget {
  const CVPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BasePage(
      title: 'Curriculum Vita | Alejandro Fernández Alburquerque',
      slivers: [
        SliverFillRemaining(
          hasScrollBody: true,
          child: Center(
            child: Text(
              'Curriculum Vitae | Work in progress',
              style: textTheme.displaySmall,
            ),
          ),
        ),
      ],
    );
  }
}
