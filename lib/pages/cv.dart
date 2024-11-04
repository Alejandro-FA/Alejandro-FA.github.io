import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/cv_data.dart';
import '../services/storage_service.dart';
import '../theme/material_window_class.dart';
import '../widgets/cv_timeline_event.dart';
import '../widgets/page_scaffold.dart';
import '../widgets/timeline.dart';

@RoutePage()
class CVPage extends StatelessWidget {
  const CVPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final screenWidth = MediaQuery.of(context).size.width;
    final double padding = max(
      MaterialWindowClass.of(context) <= MaterialWindowClass.medium ? 25 : 50,
      (screenWidth - MaterialWindowClass.large.minDP) / 2,
    );

    return PageScaffold(
      title: 'Curriculum Vitae | Alejandro Fernández Alburquerque',
      floatingActionButton: const _DownloadCVButton(),
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(
            vertical: 50,
            horizontal: padding,
          ),
          sliver: SliverList.list(
            children: [
              Padding(
                // Check: https://medium.com/geekculture/dynamically-pinned-list-headers-ee5aa23f1db4
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  AppLocalizations.of(context).education,
                  style: textTheme.displaySmall,
                ),
              ),
              Timeline(
                lineColor: theme.colorScheme.surfaceContainerHighest,
                lineWidth: 3,
                children: educationEntries.map(CVTimelineEvent.new).toList(),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 20,
                ),
                child: Text(
                  AppLocalizations.of(context).experience,
                  style: textTheme.displaySmall,
                ),
              ),
              Timeline(
                lineColor: theme.colorScheme.surfaceContainerHighest,
                lineWidth: 3,
                children: experienceEntries.map(CVTimelineEvent.new).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _DownloadCVButton extends ConsumerWidget {
  const _DownloadCVButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    return FloatingActionButton.extended(
      label: Text('Download CV', style: textTheme.titleMedium),
      tooltip: 'Download CV',
      onPressed: () async => ref.read(storageServiceProvider).downloadCV(),
      icon: const Icon(Icons.download),
    );
  }
}
