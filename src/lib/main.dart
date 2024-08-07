import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'pages/home.dart';
import 'theme/color_scheme.dart';
import 'theme/text_theme.dart';

// GoRouter configuration
final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(title: 'Alejandro Fernández'),
    ),
    GoRoute(
      path: '/Research',
      builder: (context, state) => const HomePage(title: 'Research'),
    ),
  ],
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    final TextTheme textTheme =
        createTextTheme(context, 'Noto Sans', 'Silkscreen');
    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp.router(
      title: 'Alejandro Fernández',
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      routerConfig: _router,
    );
  }
}
