import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'navigation/router.dart';
import 'theme/material_theme.dart';
import 'theme/text_theme.dart';

void main() {
  setUrlStrategy(Uri.base.host.endsWith('github.io')
      ? const HashUrlStrategy()
      : PathUrlStrategy()); // ignore: prefer_const_constructors
  runApp(ProviderScope(child: MyApp(router: AppRouter())));
}

class MyApp extends StatelessWidget {
  const MyApp({required this.router, super.key});

  final AppRouter router;

  @override
  Widget build(BuildContext context) {
    final textTheme = createTextTheme(context, 'Noto Sans', 'Silkscreen');
    final theme = MaterialTheme(textTheme);

    return MaterialApp.router(
      title: 'Alejandro Fernández Alburquerque',
      routerConfig: router.config(),
      theme: theme.light(),
      darkTheme: theme.dark(),
      highContrastTheme: theme.lightHighContrast(),
      highContrastDarkTheme: theme.darkHighContrast(),
      themeMode: ThemeMode.system,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
