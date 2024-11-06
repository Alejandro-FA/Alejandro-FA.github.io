import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../data/research_data.dart';
import '../models/link_data.dart';
import '../models/research_entry.dart';
import '../theme/window_class.dart';
import '../widgets/better_link.dart';
import '../widgets/markdown_content.dart';
import '../widgets/page_scaffold.dart';

@RoutePage()
class ResearchPage extends StatelessWidget {
  const ResearchPage({super.key});
  static const orcidUrl = 'https://orcid.org/0009-0009-0884-7015';

  @override
  Widget build(BuildContext context) => PageScaffold(
        title: 'Research | Alejandro Fernández Alburquerque',
        socialMediaRail: true,
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: 50,
              horizontal: _getPadding(context),
            ),
            sliver: SliverList.builder(
              itemCount: researchEntries.length,
              itemBuilder: (context, index) => _ResearchItem(
                researchEntries[index],
              ),
            ),
          ),
        ],
      );

  static double _getPadding(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return switch (WindowClass.of(context)) {
      WindowClass.compact => 15,
      WindowClass.medium => 30,
      WindowClass.expanded => 100,
      _ => max(100, (screenWidth - WindowClass.expanded.minDP) * 0.4),
    };
  }
}

class _ResearchItem extends StatelessWidget {
  const _ResearchItem(this.entry);

  final ResearchEntry entry;

  @override
  Widget build(BuildContext context) {
    final pdfLinks = entry.pdfLinks;
    final githubLinks = entry.githubLinks;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            MarkdownContent(file: entry.filePath),
            const SizedBox(height: 20),
            Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.spaceAround,
              runAlignment: WrapAlignment.spaceAround,
              spacing: 14,
              runSpacing: 14,
              children: [
                ...pdfLinks.map(_PdfLink.new),
                ...githubLinks.map(_GithubLink.new),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _LinkButton extends StatelessWidget {
  const _LinkButton(
    this.link, {
    required this.iconPath,
    required this.backgroundColor,
    required this.foregroundColor,
  });

  final LinkData link;
  final String iconPath;
  final Color backgroundColor;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BetterLink(
      uri: Uri.parse(link.url),
      target: LinkTarget.blank,
      builder: (context, followLink) => TextButton.icon(
        label: Text(
          link.text,
          style: textTheme.titleSmall?.copyWith(color: foregroundColor),
        ),
        icon: SvgPicture.asset(
          iconPath,
          height: 22,
          colorFilter: ColorFilter.mode(
            foregroundColor,
            BlendMode.srcIn,
          ),
        ),
        onPressed: followLink,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
        ),
      ),
    );
  }
}

class _PdfLink extends StatelessWidget {
  const _PdfLink(this.link);

  final LinkData link;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return _LinkButton(
      link,
      iconPath: 'assets/icons/pdf-file.svg',
      backgroundColor: colorScheme.errorContainer,
      foregroundColor: colorScheme.onErrorContainer,
    );
  }
}

class _GithubLink extends StatelessWidget {
  const _GithubLink(this.link);

  final LinkData link;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return _LinkButton(
      link,
      iconPath: 'assets/icons/github.svg',
      backgroundColor: colorScheme.secondaryContainer,
      foregroundColor: colorScheme.onSecondaryContainer,
    );
  }
}
