import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'pages/home.dart';
import 'pages/research.dart';
import 'pages/projects.dart';
import 'pages/cv.dart';

/// Builds the router for the app.
/// Path names must match the file names in the pages folder.
GoRouter buildRouter({required Color color}) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: 'Home',
        path: '/',
        pageBuilder: (context, state) => NoTransitionPage(
          child: Title(
            title: 'Home | Alejandro Fernández Alburquerque',
            color: color,
            child: const HomePage(),
          ),
        ),
      ),
      GoRoute(
        name: 'Research',
        path: '/research',
        pageBuilder: (context, state) => NoTransitionPage(
          child: Title(
            title: 'Research | Alejandro Fernández Alburquerque',
            color: color,
            child: const ResearchPage(),
          ),
        ),
      ),
      GoRoute(
        name: 'Projects',
        path: '/projects',
        pageBuilder: (context, state) => NoTransitionPage(
          child: Title(
            title: 'Projects | Alejandro Fernández Alburquerque',
            color: color,
            child: const ProjectsPage(),
          ),
        ),
      ),
      GoRoute(
        name: 'Curriculum Vitae',
        path: '/cv',
        pageBuilder: (context, state) => NoTransitionPage(
          child: Title(
            title: 'Curriculum Vitae | Alejandro Fernández Alburquerque',
            color: color,
            child: const CVPage(),
          ),
        ),
      ),
    ],
  );
}
