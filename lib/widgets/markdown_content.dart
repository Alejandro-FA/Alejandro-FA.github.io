import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/content_controller.dart';
import '../theme/markdown_theme.dart';
import '../widgets/better_link.dart';

class MarkdownContent extends ConsumerWidget {
  const MarkdownContent({required this.file, super.key});

  final String file;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final content = ref.watch(contentControllerProvider)[file];
    if (content == null) {
      final controller = ref.watch(contentControllerProvider.notifier);
      unawaited(controller.load(file));
    }

    return content != null
        ? MarkdownBody(
            data: content,
            selectable: true,
            styleSheet: MarkdownTheme.of(context),
            onTapLink: (text, href, title) async {
              if (href == null) return;
              return BetterLink.followLink(
                context,
                Uri.parse(href),
                LinkTarget.defaultTarget,
              );
            },
          )
        : const CircularProgressIndicator();
  }
}
