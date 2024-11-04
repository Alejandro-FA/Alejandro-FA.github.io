import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../data/research_data.dart';
import '../theme/material_window_class.dart';
import '../widgets/markdown_content.dart';
import '../widgets/page_scaffold.dart';

@RoutePage()
class ResearchPage extends StatelessWidget {
  const ResearchPage({super.key});
  static const orcidUrl = 'https://orcid.org/0009-0009-0884-7015';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double padding = max(
      MaterialWindowClass.of(context) <= MaterialWindowClass.medium ? 25 : 50,
      (screenWidth - MaterialWindowClass.expanded.minDP) / 2,
    );

    return PageScaffold(
      title: 'Research | Alejandro Fernández Alburquerque',
      socialMediaRail: true,
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(
            vertical: 50,
            horizontal: padding,
          ),
          sliver: SliverList.builder(
            itemCount: researchFiles.length,
            itemBuilder: (context, index) => Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: MarkdownContent(file: researchFiles[index]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
