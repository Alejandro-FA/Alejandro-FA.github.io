import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../utils.dart' show MaterialWindowClass;
import '../widgets/base_page.dart';

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

    return BasePage(
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
              return Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ResearchItem(contentPath: filePath),
              );
            },
          ),
        ),
      ],
    );
  }
}

class ResearchItem extends StatelessWidget {
  ResearchItem({required String contentPath, super.key})
      : content = rootBundle.loadString(contentPath);

  final Future<String> content;

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: content,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MarkdownBody(data: snapshot.data!);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      );
}
