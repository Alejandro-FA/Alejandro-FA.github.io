import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/localization_controller.dart';

class LanguageToggleButton extends ConsumerWidget {
  const LanguageToggleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localizationControllerProvider);
    final textTheme = Theme.of(context).textTheme;
    final isEnglish = locale.languageCode == 'en';

    return TextButton(
      onPressed: () {
        ref.read(localizationControllerProvider.notifier).toggleLocale();
      },
      child: Row(
        children: [
          Text(
            'EN',
            style: textTheme.bodyMedium?.copyWith(
              fontWeight: isEnglish ? FontWeight.bold : null,
              decoration: isEnglish ? TextDecoration.underline : null,
              decorationColor: textTheme.bodyMedium?.color,
            ),
          ),
          // Text('|', style: textTheme.bodySmall),
          const SizedBox(height: 12, child: VerticalDivider(thickness: 1.5)),
          Text(
            'ES',
            style: textTheme.bodyMedium?.copyWith(
              fontWeight: !isEnglish ? FontWeight.bold : null,
              decoration: !isEnglish ? TextDecoration.underline : null,
              decorationColor: textTheme.bodyMedium?.color,
            ),
          ),
        ],
      ),
    );
  }
}
