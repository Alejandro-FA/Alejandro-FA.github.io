import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'pages/cv.dart' deferred as cv;
import 'pages/home.dart' deferred as home;
import 'pages/projects.dart' deferred as projects;
import 'pages/research.dart' deferred as research;

final _homeFuture = home.loadLibrary();
final _researchFuture = research.loadLibrary();
final _projectsFuture = projects.loadLibrary();
final _cvFuture = cv.loadLibrary();

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'Home',
      path: '/',
      pageBuilder: (context, state) => NoTransitionPage(
        child: Title(
          title: 'Home | Alejandro Fernández Alburquerque',
          color: Theme.of(context).colorScheme.primary,
          child: FutureBuilder(
            future: _homeFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return home.HomePage();
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    ),
    GoRoute(
      name: 'Research',
      path: '/research',
      pageBuilder: (context, state) => NoTransitionPage(
        child: Title(
          title: 'Research | Alejandro Fernández Alburquerque',
          color: Theme.of(context).colorScheme.primary,
          child: FutureBuilder(
            future: _researchFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return research.ResearchPage();
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    ),
    GoRoute(
      name: 'Projects',
      path: '/projects',
      pageBuilder: (context, state) => NoTransitionPage(
        child: Title(
          title: 'Projects | Alejandro Fernández Alburquerque',
          color: Theme.of(context).colorScheme.primary,
          child: FutureBuilder(
            future: _projectsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return projects.ProjectsPage();
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    ),
    GoRoute(
      name: 'Curriculum Vitae',
      path: '/cv',
      pageBuilder: (context, state) => NoTransitionPage(
        child: Title(
          title: 'Curriculum Vitae | Alejandro Fernández Alburquerque',
          color: Theme.of(context).colorScheme.primary,
          child: FutureBuilder(
            future: _cvFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return cv.CVPage();
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    ),
  ],
);
