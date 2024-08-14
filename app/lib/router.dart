import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'pages/home.dart';
import 'pages/research.dart';
import 'pages/projects.dart';
import 'pages/cv.dart';

GoRouter buildRouter({required Color color}) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
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
