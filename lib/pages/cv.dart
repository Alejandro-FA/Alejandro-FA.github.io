import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../web_utils.dart' show downloadFile;
import '../widgets/base_page.dart';
import '../widgets/timeline.dart';

@RoutePage()
class CVPage extends StatelessWidget {
  const CVPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final screenWidth = MediaQuery.of(context).size.width;

    return BasePage(
      title: 'Curriculum Vitae | Alejandro Fernández Alburquerque',
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Download CV', style: textTheme.titleMedium),
        tooltip: 'Download CV',
        onPressed: () => downloadFile('/r2/alejandro_fernandez_cv-en.pdf'),
        icon: const Icon(Icons.download),
      ),
      slivers: [
        SliverPadding(
          padding: EdgeInsets.all(screenWidth * 0.1),
          sliver: SliverList.list(
            children: [
              Padding(
                // Check: https://medium.com/geekculture/dynamically-pinned-list-headers-ee5aa23f1db4
                padding: const EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 20,
                ),
                child: Text('Education', style: textTheme.displaySmall),
              ),
              Timeline(
                lineColor: theme.colorScheme.surfaceContainerHighest,
                lineWidth: 3,
                children: const [
                  MyTimelineEvent(
                    date: 'Jan 2021',
                    location: 'New York, NY',
                    description: 'Started Job at XYZ Corp',
                  ),
                  MyTimelineEvent(
                    date: 'Jun 2022',
                    location: 'San Francisco, CA',
                    description: 'Promoted to Senior Developer',
                  ),
                  MyTimelineEvent(
                    date: 'Oct 2023',
                    location: 'Remote',
                    description: 'Became a Freelance Developer',
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 20,
                ),
                child: Text('Experience', style: textTheme.displaySmall),
              ),
              Timeline(
                lineColor: theme.colorScheme.surfaceContainerHighest,
                lineWidth: 3,
                children: const [
                  MyTimelineEvent(
                    date: 'Jan 2021',
                    location: 'New York, NY',
                    description: 'Started Job at XYZ Corp',
                  ),
                  MyTimelineEvent(
                    date: 'Jun 2022',
                    location: 'San Francisco, CA',
                    description: 'Promoted to Senior Developer',
                  ),
                  MyTimelineEvent(
                    date: 'Oct 2023',
                    location: 'Remote',
                    description: 'Became a Freelance Developer',
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MyTimelineEvent implements TimelineEvent {
  const MyTimelineEvent({
    required this.date,
    required this.location,
    required this.description,
  });

  final String date;
  final String location;
  final String description;

  @override
  Widget buildLeft(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          date,
          style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(location, style: textTheme.bodyLarge),
      ],
    );
  }

  @override
  Widget buildIcon(BuildContext context) => Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          shape: BoxShape.circle,
        ),
      );

  @override
  Widget buildRight(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        description,
        style: textTheme.bodyLarge?.copyWith(
          color: colorScheme.onSurface,
        ),
      ),
    );
  }
}
