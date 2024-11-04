import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'controllers/content_controller.dart';
import 'controllers/localization_controller.dart';
import 'navigation/router.dart';
import 'theme/markdown_theme.dart';
import 'theme/material_theme.dart';
import 'theme/text_theme.dart';

void main() {
  setUrlStrategy(Uri.base.host.endsWith('github.io')
      ? const HashUrlStrategy()
      : PathUrlStrategy()); // ignore: prefer_const_constructors
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = createTextTheme(context, 'Noto Sans', 'Silkscreen');
    final theme = MaterialTheme(textTheme);
    final router = AppRouter(
      cacheController: ref.watch(contentControllerProvider.notifier),
    );

    return MyMaterialApp(theme: theme, router: router);
  }
}

class MyMaterialApp extends ConsumerWidget {
  const MyMaterialApp({required this.theme, required this.router, super.key});

  final MaterialTheme theme;
  final AppRouter router;

  @override
  Widget build(BuildContext context, WidgetRef ref) => MaterialApp.router(
        title: 'Alejandro Fernández Alburquerque',
        routerConfig: router.config(),
        theme: theme.light(),
        darkTheme: theme.dark(),
        highContrastTheme: theme.lightHighContrast(),
        highContrastDarkTheme: theme.darkHighContrast(),
        themeMode: ThemeMode.system,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: ref.watch(localizationControllerProvider),
        builder: (context, child) => MarkdownTheme.fromTheme(
          Theme.of(context),
          child: child ?? const SizedBox.shrink(),
        ),
      );
}
