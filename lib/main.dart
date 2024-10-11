import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'theme/material_theme.dart';
import 'theme/text_theme.dart';
import 'web_router.dart';

void main() {
  setUrlStrategy(Uri.base.host.endsWith('github.io')
      ? const HashUrlStrategy()
      : PathUrlStrategy()); // ignore: prefer_const_constructors
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = createTextTheme(context, 'Noto Sans', 'Silkscreen');
    final theme = MaterialTheme(textTheme);

    return MaterialApp.router(
      title: 'Alejandro Fernández Alburquerque',
      routerConfig: router,
      theme: theme.light(),
      darkTheme: theme.dark(),
      highContrastTheme: theme.lightHighContrast(),
      highContrastDarkTheme: theme.darkHighContrast(),
      themeMode: ThemeMode.system,
    );
  }
}
