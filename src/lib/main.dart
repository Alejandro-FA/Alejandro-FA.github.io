import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/home.dart';
import 'theme/color_scheme.dart';
import 'theme/text_theme.dart';

void main() {
  GoogleFonts.config.allowRuntimeFetching = false;
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
            child: const HomePage(title: 'Work in progress'),
          ),
        ),
        GoRoute(
          path: '/Research',
          builder: (context, state) => Title(
            title: 'Research | Alejandro Fernández Alburquerque',
            color: theme.primaryColor,
            child: const HomePage(title: 'Work in progress | Research'),
          ),
        ),
        GoRoute(
          path: '/About',
          builder: (context, state) => Title(
            title: 'About Me | Alejandro Fernández Alburquerque',
            color: theme.primaryColor,
            child: const HomePage(title: 'Work in progress | About Me'),
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
