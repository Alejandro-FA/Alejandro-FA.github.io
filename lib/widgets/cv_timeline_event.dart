import 'package:flutter/material.dart';

import '../models/cv_entry.dart';
import '../widgets/markdown_content.dart';
import 'timeline.dart';

class CVTimelineEvent extends StatelessWidget {
  const CVTimelineEvent(this.data, {super.key});

  final CVEntry data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return TimelineEvent(
      icon: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: theme.colorScheme.primary,
          shape: BoxShape.circle,
        ),
      ),
      label: Column(
        children: [
          Text(
            data.date,
            style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(data.location, style: textTheme.bodyLarge),
        ],
      ),
      details: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: MarkdownContent(file: data.descriptionPath),
        ),
      ),
    );
  }
}
