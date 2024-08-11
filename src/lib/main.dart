import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'pages/home/home.dart';
import 'theme/color_scheme.dart';
import 'theme/text_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    final textTheme = createTextTheme(context, 'Noto Sans', 'Silkscreen');
    final theme = brightness == Brightness.light
        ? MaterialTheme(textTheme).light()
        : MaterialTheme(textTheme).dark();
    final router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => Title(
            title: 'Home | Alejandro Fernández Alburquerque',
            color: theme.primaryColor,
            child: const HomePage(),
          ),
        ),
        GoRoute(
          path: '/Research',
          builder: (context, state) => Title(
            title: 'Research | Alejandro Fernández Alburquerque',
            color: theme.primaryColor,
            child: const HomePage(),
          ),
        ),
        GoRoute(
          path: '/Projects',
          builder: (context, state) => Title(
            title: 'Projects | Alejandro Fernández Alburquerque',
            color: theme.primaryColor,
            child: const HomePage(),
          ),
        ),
        GoRoute(
          path: '/CV',
          builder: (context, state) => Title(
            title: 'Curriculum Vitae | Alejandro Fernández Alburquerque',
            color: theme.primaryColor,
            child: const HomePage(),
          ),
        ),
      ],
    );

    return MaterialApp.router(
      title: 'Alejandro Fernández Alburquerque',
      theme: theme,
      routerConfig: router,
    );
  }
}
