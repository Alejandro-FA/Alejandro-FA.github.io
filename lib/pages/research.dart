import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/content_controller.dart';
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
            itemBuilder: (context, index) => Card(
              child: _ResearchItem(contentFile: contentFiles[index]),
            ),
          ),
        ),
      ],
    );
  }
}

class _ResearchItem extends ConsumerWidget {
  const _ResearchItem({required this.contentFile});

  final String contentFile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final content = ref.watch(contentControllerProvider(contentFile));

    return Padding(
      padding: const EdgeInsets.all(20),
      child: switch (content) {
        AsyncData(:final value) => MarkdownBody(data: value),
        AsyncError() => const Text('Oops, something unexpected happened'),
        _ => const SizedBox.shrink(),
      },
    );
  }
}
