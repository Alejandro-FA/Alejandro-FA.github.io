import 'package:flutter/material.dart';
import 'theme/material_theme.dart';
import 'theme/text_theme.dart';
import 'utils.dart';
import 'router.dart';

void main() {
  decideUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = createTextTheme(context, 'Noto Sans', 'Silkscreen');
    final theme = MaterialTheme(textTheme);

    return InteractiveViewer(
      child: MaterialApp.router(
        title: 'Alejandro Fernández Alburquerque',
        routerConfig: buildRouter(color: theme.light().primaryColor),
        theme: theme.light(),
        darkTheme: theme.dark(),
        highContrastTheme: theme.lightHighContrast(),
        highContrastDarkTheme: theme.darkHighContrast(),
        themeMode: ThemeMode.system,
      ),
    );
  }
}
