import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../theme/material_window_class.dart';
import '../widgets/page_scaffold.dart';

@RoutePage()
class ResearchPage extends StatelessWidget {
  const ResearchPage({super.key});
  static const orcidUrl = 'https://orcid.org/0009-0009-0884-7015';
  static const contentFiles = [
    'tfg.md',
  ];

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
            itemCount: contentFiles.length,
            itemBuilder: (context, index) {
              final basePath = AppLocalizations.of(context).contentPath;
              final filePath = '$basePath${contentFiles[index]}';
              return Card(
                child: ResearchItem(contentPath: filePath),
              );
            },
          ),
        ),
      ],
    );
  }
}

// TODO: wait for content to load before loading page.
class ResearchItem extends StatelessWidget {
  ResearchItem({required String contentPath, super.key})
      : content = rootBundle.loadString(contentPath);

  final Future<String> content;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(20),
        child: FutureBuilder(
          future: content,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return MarkdownBody(data: snapshot.data!);
            }
            return const SizedBox.shrink();
          },
        ),
      );
}
